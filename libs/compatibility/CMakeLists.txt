
cmake_minimum_required(VERSION 3.5)
project(boost_compatibility)
include(CMakePackageConfigHelpers)


add_library(boost_compatibility INTERFACE
)
add_library(boost::compatibility ALIAS boost_compatibility)
set_property(TARGET boost_compatibility PROPERTY EXPORT_NAME compatibility)

target_include_directories(boost_compatibility INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)




install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_compatibility EXPORT boost_compatibility-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_compatibility-targets
  FILE boost_compatibility-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_compatibility
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_compatibility-config.cmake" "include(CMakeFindDependencyMacro)")


file(APPEND "${PROJECT_BINARY_DIR}/boost_compatibility-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_compatibility-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_compatibility-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_compatibility-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_compatibility-config-version.cmake"
  DESTINATION lib/cmake/boost_compatibility
)

