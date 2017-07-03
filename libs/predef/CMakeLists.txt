
cmake_minimum_required(VERSION 3.5)
project(boost_predef)
include(CMakePackageConfigHelpers)


add_library(boost_predef INTERFACE
)
add_library(boost::predef ALIAS boost_predef)
set_property(TARGET boost_predef PROPERTY EXPORT_NAME predef)

target_include_directories(boost_predef INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)




install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_predef EXPORT boost_predef-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_predef-targets
  FILE boost_predef-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_predef
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_predef-config.cmake" "include(CMakeFindDependencyMacro)")


file(APPEND "${PROJECT_BINARY_DIR}/boost_predef-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_predef-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_predef-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_predef-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_predef-config-version.cmake"
  DESTINATION lib/cmake/boost_predef
)

