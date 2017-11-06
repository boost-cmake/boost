option(BUILD_TESTING off)

include(CMakeParseArguments)
enable_testing()

if(NOT TARGET check)
    add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND} --output-on-failure -C ${CMAKE_CFG_INTDIR} WORKING_DIRECTORY ${CMAKE_BINARY_DIR})
endif()


if(NOT TARGET tests)
    add_custom_target(tests COMMENT "Build all tests.")
    add_dependencies(check tests)
endif()

if(NOT TARGET check-${PROJECT_NAME})
    add_custom_target(check-${PROJECT_NAME} COMMAND ${CMAKE_CTEST_COMMAND} -L ${PROJECT_NAME} --output-on-failure -C ${CMAKE_CFG_INTDIR} WORKING_DIRECTORY ${CMAKE_BINARY_DIR})
endif()

if(NOT TARGET tests-${PROJECT_NAME})
    add_custom_target(tests-${PROJECT_NAME} COMMENT "Build all tests for ${PROJECT_NAME}.")
    add_dependencies(check-${PROJECT_NAME} tests-${PROJECT_NAME})
endif()

function(bcm_mark_as_test)
    foreach(TEST_TARGET ${ARGN})
        if (NOT BUILD_TESTING)
            get_target_property(TEST_TARGET_TYPE ${TEST_TARGET} TYPE)
            # We can onle use EXCLUDE_FROM_ALL on build targets
            if(NOT "${TEST_TARGET_TYPE}" STREQUAL "INTERFACE_LIBRARY")
                set_target_properties(${TEST_TARGET}
                    PROPERTIES EXCLUDE_FROM_ALL TRUE
                )
            endif()
        endif()
        add_dependencies(tests ${TEST_TARGET})
        add_dependencies(tests-${PROJECT_NAME} ${TEST_TARGET})
    endforeach()
endfunction(bcm_mark_as_test)

if(NOT TARGET _bcm_internal_tests-${PROJECT_NAME})
    file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/_bcm_internal_tests-${PROJECT_NAME}.cpp "")
    add_library(_bcm_internal_tests-${PROJECT_NAME} STATIC ${CMAKE_CURRENT_BINARY_DIR}/_bcm_internal_tests-${PROJECT_NAME}.cpp)
    bcm_mark_as_test(_bcm_internal_tests-${PROJECT_NAME})
endif()

foreach(scope DIRECTORY TARGET)
    define_property(${scope} PROPERTY "BCM_TEST_DEPENDENCIES" INHERITED
        BRIEF_DOCS "Default test dependencies"
        FULL_DOCS "Default test dependencies"
    )
endforeach()

function(bcm_test_link_libraries)
    if(BUILD_TESTING)
        set_property(DIRECTORY APPEND PROPERTY BCM_TEST_DEPENDENCIES ${ARGN})
        target_link_libraries(_bcm_internal_tests-${PROJECT_NAME} ${ARGN})
    else()
        foreach(TARGET ${ARGN})
            if(TARGET ${TARGET})
                set_property(DIRECTORY APPEND PROPERTY BCM_TEST_DEPENDENCIES ${TARGET})
                target_link_libraries(_bcm_internal_tests-${PROJECT_NAME} ${TARGET})
            elseif(${TARGET} MATCHES "::")
                bcm_shadow_exists(HAS_TARGET ${TARGET})
                set_property(DIRECTORY APPEND PROPERTY BCM_TEST_DEPENDENCIES $<${HAS_TARGET}:${TARGET}>)
                target_link_libraries(_bcm_internal_tests-${PROJECT_NAME} $<${HAS_TARGET}:${TARGET}>)
            else()
                set_property(DIRECTORY APPEND PROPERTY BCM_TEST_DEPENDENCIES ${TARGET})
                target_link_libraries(_bcm_internal_tests-${PROJECT_NAME} ${TARGET})
            endif()
        endforeach()
    endif()
endfunction()

function(bcm_target_link_test_libs TARGET)
    # target_link_libraries(${TARGET}
    #     $<TARGET_PROPERTY:BCM_TEST_DEPENDENCIES>
    # )
    get_property(DEPS DIRECTORY PROPERTY BCM_TEST_DEPENDENCIES)
    target_link_libraries(${TARGET} ${DEPS})
endfunction()


function(bcm_test)
    if(NOT BUILD_TESTING)
        return()
    endif()
    set(options COMPILE_ONLY WILL_FAIL NO_TEST_LIBS)
    set(oneValueArgs NAME)
    set(multiValueArgs SOURCES CONTENT ARGS)

    cmake_parse_arguments(PARSE "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if(PARSE_UNPARSED_ARGUMENTS)
        message(FATAL_ERROR "Unknown keywords given to bcm_test(): \"${PARSE_UNPARSED_ARGUMENTS}\"")
    endif()

    # TODO: Check if name exists

    set(SOURCES ${PARSE_SOURCES})
    if(PARSE_CONTENT)
        file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/generated-${PARSE_NAME}.cpp "${PARSE_CONTENT}")
        set(SOURCES ${CMAKE_CURRENT_BINARY_DIR}/generated-${PARSE_NAME}.cpp)
    endif()

    if(PARSE_COMPILE_ONLY)
        add_library(${PARSE_NAME} STATIC EXCLUDE_FROM_ALL ${SOURCES})
        add_test(NAME ${PARSE_NAME}
            COMMAND ${CMAKE_COMMAND} --build . --target ${PARSE_NAME} --config $<CONFIGURATION>
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR})

        # set_tests_properties(${PARSE_NAME} PROPERTIES RESOURCE_LOCK bcm_test_compile_only)
    else()
        add_executable(${PARSE_NAME} ${SOURCES})
        bcm_mark_as_test(${PARSE_NAME})
        if(WIN32)
            
            # TODO: Don't use LIBRARY_OUTPUT_PATH as cwd, instead add
            #       LIBRARY_OUTPUT_PATH to library path
            add_test(NAME ${PARSE_NAME} WORKING_DIRECTORY ${LIBRARY_OUTPUT_PATH} COMMAND ${PARSE_NAME}${CMAKE_EXECUTABLE_SUFFIX} ${PARSE_ARGS})
        else()
            add_test(NAME ${PARSE_NAME} COMMAND ${PARSE_NAME} ${PARSE_ARGS} WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
        endif()
    endif()
    if(PARSE_WILL_FAIL)
        set_tests_properties(${PARSE_NAME} PROPERTIES WILL_FAIL TRUE)
    endif()
    set_tests_properties(${PARSE_NAME} PROPERTIES LABELS ${PROJECT_NAME})
    if(NOT PARSE_NO_TEST_LIBS)
        bcm_target_link_test_libs(${PARSE_NAME})
    endif()
endfunction(bcm_test)

function(bcm_test_header)
    set(options STATIC NO_TEST_LIBS)
    set(oneValueArgs NAME HEADER)
    set(multiValueArgs)

    cmake_parse_arguments(PARSE "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if(PARSE_STATIC)
        file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/header-main-include-${PARSE_NAME}.cpp 
            "#include <${PARSE_HEADER}>\nint main() {}\n"
        )
        file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/header-static-include-${PARSE_NAME}.cpp 
            "#include <${PARSE_HEADER}>\n"
        )
        bcm_test(NAME ${PARSE_NAME} SOURCES
            ${CMAKE_CURRENT_BINARY_DIR}/header-main-include-${PARSE_NAME}.cpp 
            ${CMAKE_CURRENT_BINARY_DIR}/header-static-include-${PARSE_NAME}.cpp
        )
    else()
        bcm_test(NAME ${PARSE_NAME} CONTENT
            "#include <${PARSE_HEADER}>\nint main() {}\n"
        )
    endif()
    set_tests_properties(${PARSE_NAME} PROPERTIES LABELS ${PROJECT_NAME})
    if(NOT PARSE_NO_TEST_LIBS)
        bcm_target_link_test_libs(${PARSE_NAME})
    endif()
endfunction(bcm_test_header)


function(bcm_add_test_subdirectory)
if(BUILD_TESTING)
    add_subdirectory(test)
endif()
endfunction()