
cmake_minimum_required(VERSION 3.5)
project(boost_tuple)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_type_traits)
find_package(boost_config)

add_library(boost_tuple INTERFACE
)
add_library(boost::tuple ALIAS boost_tuple)
set_property(TARGET boost_tuple PROPERTY EXPORT_NAME tuple)

target_include_directories(boost_tuple INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_tuple INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_tuple INTERFACE boost::static_assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_tuple INTERFACE boost::type_traits)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_tuple INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_tuple EXPORT boost_tuple-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_tuple-targets
  FILE boost_tuple-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_tuple
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_tuple-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tuple-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tuple-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tuple-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tuple-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_tuple-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_tuple-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_tuple-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_tuple-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_tuple-config-version.cmake"
  DESTINATION lib/cmake/boost_tuple
)

