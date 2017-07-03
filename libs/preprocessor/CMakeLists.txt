
cmake_minimum_required(VERSION 3.5)
project(boost_preprocessor)
include(CMakePackageConfigHelpers)


add_library(boost_preprocessor INTERFACE
)
add_library(boost::preprocessor ALIAS boost_preprocessor)
set_property(TARGET boost_preprocessor PROPERTY EXPORT_NAME preprocessor)

target_include_directories(boost_preprocessor INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)




install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_preprocessor EXPORT boost_preprocessor-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_preprocessor-targets
  FILE boost_preprocessor-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_preprocessor
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_preprocessor-config.cmake" "include(CMakeFindDependencyMacro)")


file(APPEND "${PROJECT_BINARY_DIR}/boost_preprocessor-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_preprocessor-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_preprocessor-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_preprocessor-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_preprocessor-config-version.cmake"
  DESTINATION lib/cmake/boost_preprocessor
)

