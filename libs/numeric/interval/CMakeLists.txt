
cmake_minimum_required(VERSION 3.5)
project(boost_numeric_interval)
include(CMakePackageConfigHelpers)

find_package(boost_logic)
find_package(boost_config)
find_package(boost_detail)

add_library(boost_numeric_interval INTERFACE
)
add_library(boost::numeric_interval ALIAS boost_numeric_interval)
set_property(TARGET boost_numeric_interval PROPERTY EXPORT_NAME numeric_interval)

target_include_directories(boost_numeric_interval INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_logic_FOUND)
target_link_libraries(boost_numeric_interval INTERFACE boost::logic)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_numeric_interval INTERFACE boost::config)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_numeric_interval INTERFACE boost::detail)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_numeric_interval EXPORT boost_numeric_interval-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_numeric_interval-targets
  FILE boost_numeric_interval-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_numeric_interval
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_numeric_interval-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_logic_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_interval-config.cmake" "
find_package(boost_logic)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_interval-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_interval-config.cmake" "
find_package(boost_detail)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_interval-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_numeric_interval-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_numeric_interval-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_numeric_interval-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_numeric_interval-config-version.cmake"
  DESTINATION lib/cmake/boost_numeric_interval
)

