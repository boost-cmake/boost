
cmake_minimum_required(VERSION 3.5)
project(boost_crc)
include(CMakePackageConfigHelpers)

find_package(boost_integer)
find_package(boost_config)

add_library(boost_crc INTERFACE
)
add_library(boost::crc ALIAS boost_crc)
set_property(TARGET boost_crc PROPERTY EXPORT_NAME crc)

target_include_directories(boost_crc INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_integer_FOUND)
target_link_libraries(boost_crc INTERFACE boost::integer)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_crc INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_crc EXPORT boost_crc-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_crc-targets
  FILE boost_crc-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_crc
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_crc-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_crc-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_crc-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_crc-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_crc-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_crc-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_crc-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_crc-config-version.cmake"
  DESTINATION lib/cmake/boost_crc
)

