
cmake_minimum_required(VERSION 3.5)
project(boost_static_assert)
include(CMakePackageConfigHelpers)

find_package(boost_config)

add_library(boost_static_assert INTERFACE
)
add_library(boost::static_assert ALIAS boost_static_assert)
set_property(TARGET boost_static_assert PROPERTY EXPORT_NAME static_assert)

target_include_directories(boost_static_assert INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_config_FOUND)
target_link_libraries(boost_static_assert INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_static_assert EXPORT boost_static_assert-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_static_assert-targets
  FILE boost_static_assert-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_static_assert
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_static_assert-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_static_assert-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_static_assert-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_static_assert-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_static_assert-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_static_assert-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_static_assert-config-version.cmake"
  DESTINATION lib/cmake/boost_static_assert
)

