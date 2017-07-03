
cmake_minimum_required(VERSION 3.5)
project(boost_config)
include(CMakePackageConfigHelpers)


add_library(boost_config INTERFACE
)
add_library(boost::config ALIAS boost_config)
set_property(TARGET boost_config PROPERTY EXPORT_NAME config)

target_include_directories(boost_config INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)




install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_config EXPORT boost_config-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_config-targets
  FILE boost_config-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_config
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_config-config.cmake" "include(CMakeFindDependencyMacro)")


file(APPEND "${PROJECT_BINARY_DIR}/boost_config-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_config-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_config-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_config-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_config-config-version.cmake"
  DESTINATION lib/cmake/boost_config
)

