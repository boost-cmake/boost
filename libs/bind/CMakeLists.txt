
cmake_minimum_required(VERSION 3.5)
project(boost_bind)
include(CMakePackageConfigHelpers)

find_package(boost_config)
find_package(boost_core)

add_library(boost_bind INTERFACE
)
add_library(boost::bind ALIAS boost_bind)
set_property(TARGET boost_bind PROPERTY EXPORT_NAME bind)

target_include_directories(boost_bind INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_config_FOUND)
target_link_libraries(boost_bind INTERFACE boost::config)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_bind INTERFACE boost::core)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_bind EXPORT boost_bind-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_bind-targets
  FILE boost_bind-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_bind
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_bind-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bind-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bind-config.cmake" "
find_package(boost_core)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_bind-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_bind-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_bind-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_bind-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_bind-config-version.cmake"
  DESTINATION lib/cmake/boost_bind
)

