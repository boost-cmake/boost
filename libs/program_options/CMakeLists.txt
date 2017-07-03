
cmake_minimum_required(VERSION 3.5)
project(boost_program_options)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_tokenizer)
find_package(boost_iterator)
find_package(boost_bind)
find_package(boost_detail)
find_package(boost_throw_exception)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_lexical_cast)
find_package(boost_config)
find_package(boost_any)

add_library(boost_program_options 
src/value_semantic.cpp
src/winmain.cpp
src/split.cpp
src/utf8_codecvt_facet.cpp
src/positional_options.cpp
src/options_description.cpp
src/config_file.cpp
src/variables_map.cpp
src/parsers.cpp
src/convert.cpp
src/cmdline.cpp
)
add_library(boost::program_options ALIAS boost_program_options)
set_property(TARGET boost_program_options PROPERTY EXPORT_NAME program_options)

target_include_directories(boost_program_options PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::static_assert)
endif()
if(boost_tokenizer_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::tokenizer)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::iterator)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::bind)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::detail)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::throw_exception)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::smart_ptr)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::lexical_cast)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::config)
endif()
if(boost_any_FOUND)
target_link_libraries(boost_program_options PUBLIC boost::any)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_program_options EXPORT boost_program_options-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_program_options-targets
  FILE boost_program_options-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_program_options
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_tokenizer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_tokenizer)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_any_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
find_package(boost_any)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_program_options-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_program_options-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_program_options-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_program_options-config-version.cmake"
  DESTINATION lib/cmake/boost_program_options
)

