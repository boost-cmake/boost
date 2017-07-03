
cmake_minimum_required(VERSION 3.5)
project(boost_winapi)
include(CMakePackageConfigHelpers)

find_package(boost_config)
find_package(boost_predef)

add_library(boost_winapi INTERFACE
)
add_library(boost::winapi ALIAS boost_winapi)
set_property(TARGET boost_winapi PROPERTY EXPORT_NAME winapi)

target_include_directories(boost_winapi INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_config_FOUND)
target_link_libraries(boost_winapi INTERFACE boost::config)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_winapi INTERFACE boost::predef)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_winapi EXPORT boost_winapi-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_winapi-targets
  FILE boost_winapi-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_winapi
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_winapi-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_winapi-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_winapi-config.cmake" "
find_package(boost_predef)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_winapi-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_winapi-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_winapi-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_winapi-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_winapi-config-version.cmake"
  DESTINATION lib/cmake/boost_winapi
)

