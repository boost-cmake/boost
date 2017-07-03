
cmake_minimum_required(VERSION 3.5)
project(boost_type_traits)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_config)

add_library(boost_type_traits INTERFACE
)
add_library(boost::type_traits ALIAS boost_type_traits)
set_property(TARGET boost_type_traits PROPERTY EXPORT_NAME type_traits)

target_include_directories(boost_type_traits INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_type_traits INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_type_traits INTERFACE boost::static_assert)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_type_traits INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_type_traits EXPORT boost_type_traits-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_type_traits-targets
  FILE boost_type_traits-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_type_traits
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_type_traits-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_traits-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_traits-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_traits-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_type_traits-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_type_traits-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_type_traits-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_type_traits-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_type_traits-config-version.cmake"
  DESTINATION lib/cmake/boost_type_traits
)

