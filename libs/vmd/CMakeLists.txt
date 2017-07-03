
cmake_minimum_required(VERSION 3.5)
project(boost_vmd)
include(CMakePackageConfigHelpers)

find_package(boost_preprocessor)

add_library(boost_vmd INTERFACE
)
add_library(boost::vmd ALIAS boost_vmd)
set_property(TARGET boost_vmd PROPERTY EXPORT_NAME vmd)

target_include_directories(boost_vmd INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_preprocessor_FOUND)
target_link_libraries(boost_vmd INTERFACE boost::preprocessor)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_vmd EXPORT boost_vmd-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_vmd-targets
  FILE boost_vmd-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_vmd
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_vmd-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_vmd-config.cmake" "
find_package(boost_preprocessor)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_vmd-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_vmd-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_vmd-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_vmd-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_vmd-config-version.cmake"
  DESTINATION lib/cmake/boost_vmd
)

