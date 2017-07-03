
cmake_minimum_required(VERSION 3.5)
project(boost_regex)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_predef)
find_package(boost_mpl)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_smart_ptr)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_regex 
src/regex_raw_buffer.cpp
src/static_mutex.cpp
src/regex.cpp
src/w32_regex_traits.cpp
src/regex_traits_defaults.cpp
src/cregex.cpp
src/wc_regex_traits.cpp
src/c_regex_traits.cpp
src/regex_debug.cpp
src/icu.cpp
src/fileiter.cpp
src/cpp_regex_traits.cpp
src/posix_api.cpp
src/wide_posix_api.cpp
src/winstances.cpp
src/usinstances.cpp
src/instances.cpp
)
add_library(boost::regex ALIAS boost_regex)
set_property(TARGET boost_regex PROPERTY EXPORT_NAME regex)

target_include_directories(boost_regex PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_regex PUBLIC boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_regex PUBLIC boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_regex PUBLIC boost::iterator)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_regex PUBLIC boost::predef)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_regex PUBLIC boost::mpl)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_regex PUBLIC boost::functional)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_regex PUBLIC boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_regex PUBLIC boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_regex PUBLIC boost::concept_check)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_regex PUBLIC boost::smart_ptr)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_regex PUBLIC boost::integer)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_regex PUBLIC boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_regex PUBLIC boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_regex EXPORT boost_regex-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_regex-targets
  FILE boost_regex-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_regex
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_regex-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_regex-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_regex-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_regex-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_regex-config-version.cmake"
  DESTINATION lib/cmake/boost_regex
)

