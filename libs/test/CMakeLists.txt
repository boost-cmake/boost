
cmake_minimum_required(VERSION 3.5)
project(boost_test)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_exception)
find_package(boost_iterator)
find_package(boost_algorithm)
find_package(boost_static_assert)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_timer)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_optional)
find_package(boost_preprocessor)
find_package(boost_io)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_numeric_conversion)
find_package(boost_smart_ptr)

add_library(boost_test 
src/results_collector.cpp
src/results_reporter.cpp
src/xml_log_formatter.cpp
src/unit_test_parameters.cpp
src/compiler_log_formatter.cpp
src/xml_report_formatter.cpp
src/execution_monitor.cpp
src/test_tree.cpp
src/unit_test_monitor.cpp
src/progress_monitor.cpp
src/test_main.cpp
src/junit_log_formatter.cpp
src/framework.cpp
src/unit_test_main.cpp
src/debug.cpp
src/decorator.cpp
src/plain_report_formatter.cpp
src/unit_test_log.cpp
src/cpp_main.cpp
src/test_tools.cpp
)
add_library(boost::test ALIAS boost_test)
set_property(TARGET boost_test PROPERTY EXPORT_NAME test)

target_include_directories(boost_test PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_test PUBLIC boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_test PUBLIC boost::core)
endif()
if(boost_exception_FOUND)
target_link_libraries(boost_test PUBLIC boost::exception)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_test PUBLIC boost::iterator)
endif()
if(boost_algorithm_FOUND)
target_link_libraries(boost_test PUBLIC boost::algorithm)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_test PUBLIC boost::static_assert)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_test PUBLIC boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_test PUBLIC boost::mpl)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_test PUBLIC boost::detail)
endif()
if(boost_timer_FOUND)
target_link_libraries(boost_test PUBLIC boost::timer)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_test PUBLIC boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_test PUBLIC boost::type_traits)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_test PUBLIC boost::optional)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_test PUBLIC boost::preprocessor)
endif()
if(boost_io_FOUND)
target_link_libraries(boost_test PUBLIC boost::io)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_test PUBLIC boost::utility)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_test PUBLIC boost::config)
endif()
if(boost_numeric_conversion_FOUND)
target_link_libraries(boost_test PUBLIC boost::numeric_conversion)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_test PUBLIC boost::smart_ptr)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_test EXPORT boost_test-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_test-targets
  FILE boost_test-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_test
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_exception)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_algorithm_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_algorithm)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_timer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_timer)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_io_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_io)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_numeric_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_numeric_conversion)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
find_package(boost_smart_ptr)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_test-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_test-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_test-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_test-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_test-config-version.cmake"
  DESTINATION lib/cmake/boost_test
)

