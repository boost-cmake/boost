
cmake_minimum_required(VERSION 3.5)
project(boost_integer)
include(CMakePackageConfigHelpers)

find_package(boost_static_assert)
find_package(boost_config)

add_library(boost_integer INTERFACE
)
add_library(boost::integer ALIAS boost_integer)
set_property(TARGET boost_integer PROPERTY EXPORT_NAME integer)

target_include_directories(boost_integer INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_static_assert_FOUND)
target_link_libraries(boost_integer INTERFACE boost::static_assert)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_integer INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_integer EXPORT boost_integer-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_integer-targets
  FILE boost_integer-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_integer
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_integer-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_integer-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_integer-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_integer-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_integer-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_integer-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_integer-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_integer-config-version.cmake"
  DESTINATION lib/cmake/boost_integer
)

