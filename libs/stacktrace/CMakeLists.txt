
cmake_minimum_required(VERSION 3.5)
project(boost_stacktrace)
include(CMakePackageConfigHelpers)

find_package(boost_static_assert)
find_package(boost_core)
find_package(boost_winapi)
find_package(boost_type_traits)
find_package(boost_lexical_cast)
find_package(boost_config)
find_package(boost_array)

add_library(boost_stacktrace 
src/backtrace.cpp
src/basic.cpp
src/addr2line.cpp
src/noop.cpp
)
add_library(boost::stacktrace ALIAS boost_stacktrace)
set_property(TARGET boost_stacktrace PROPERTY EXPORT_NAME stacktrace)

target_include_directories(boost_stacktrace PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_static_assert_FOUND)
target_link_libraries(boost_stacktrace PUBLIC boost::static_assert)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_stacktrace PUBLIC boost::core)
endif()
if(boost_winapi_FOUND)
target_link_libraries(boost_stacktrace PUBLIC boost::winapi)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_stacktrace PUBLIC boost::type_traits)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_stacktrace PUBLIC boost::lexical_cast)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_stacktrace PUBLIC boost::config)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_stacktrace PUBLIC boost::array)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_stacktrace EXPORT boost_stacktrace-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_stacktrace-targets
  FILE boost_stacktrace-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_stacktrace
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_stacktrace-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_stacktrace-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_stacktrace-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_winapi_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_stacktrace-config.cmake" "
find_package(boost_winapi)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_stacktrace-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_stacktrace-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_stacktrace-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_stacktrace-config.cmake" "
find_package(boost_array)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_stacktrace-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_stacktrace-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_stacktrace-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_stacktrace-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_stacktrace-config-version.cmake"
  DESTINATION lib/cmake/boost_stacktrace
)

