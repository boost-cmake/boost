
cmake_minimum_required(VERSION 3.5)
project(boost_logic)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_config)

add_library(boost_logic INTERFACE
)
add_library(boost::logic ALIAS boost_logic)
set_property(TARGET boost_logic PROPERTY EXPORT_NAME logic)

target_include_directories(boost_logic INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_logic INTERFACE boost::core)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_logic INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_logic EXPORT boost_logic-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_logic-targets
  FILE boost_logic-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_logic
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_logic-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_logic-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_logic-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_logic-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_logic-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_logic-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_logic-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_logic-config-version.cmake"
  DESTINATION lib/cmake/boost_logic
)

