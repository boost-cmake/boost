
cmake_minimum_required(VERSION 3.5)
project(boost_polygon)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_mpl)
find_package(boost_config)

add_library(boost_polygon INTERFACE
)
add_library(boost::polygon ALIAS boost_polygon)
set_property(TARGET boost_polygon PROPERTY EXPORT_NAME polygon)

target_include_directories(boost_polygon INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_polygon INTERFACE boost::core)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_polygon INTERFACE boost::mpl)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_polygon INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_polygon EXPORT boost_polygon-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_polygon-targets
  FILE boost_polygon-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_polygon
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_polygon-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_polygon-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_polygon-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_polygon-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_polygon-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_polygon-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_polygon-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_polygon-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_polygon-config-version.cmake"
  DESTINATION lib/cmake/boost_polygon
)

