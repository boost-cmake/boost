
cmake_minimum_required(VERSION 3.5)
project(boost_io)
include(CMakePackageConfigHelpers)

find_package(boost_config)

add_library(boost_io INTERFACE
)
add_library(boost::io ALIAS boost_io)
set_property(TARGET boost_io PROPERTY EXPORT_NAME io)

target_include_directories(boost_io INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_config_FOUND)
target_link_libraries(boost_io INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_io EXPORT boost_io-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_io-targets
  FILE boost_io-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_io
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_io-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_io-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_io-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_io-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_io-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_io-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_io-config-version.cmake"
  DESTINATION lib/cmake/boost_io
)

