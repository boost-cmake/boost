
cmake_minimum_required(VERSION 3.5)
project(boost_throw_exception)
include(CMakePackageConfigHelpers)

find_package(boost_assert)
find_package(boost_config)

add_library(boost_throw_exception INTERFACE
)
add_library(boost::throw_exception ALIAS boost_throw_exception)
set_property(TARGET boost_throw_exception PROPERTY EXPORT_NAME throw_exception)

target_include_directories(boost_throw_exception INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_assert_FOUND)
target_link_libraries(boost_throw_exception INTERFACE boost::assert)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_throw_exception INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_throw_exception EXPORT boost_throw_exception-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_throw_exception-targets
  FILE boost_throw_exception-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_throw_exception
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_throw_exception-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_throw_exception-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_throw_exception-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_throw_exception-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_throw_exception-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_throw_exception-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_throw_exception-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_throw_exception-config-version.cmake"
  DESTINATION lib/cmake/boost_throw_exception
)

