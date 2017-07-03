
cmake_minimum_required(VERSION 3.5)
project(boost_sort)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_type_traits)
find_package(boost_serialization)
find_package(boost_config)

add_library(boost_sort INTERFACE
)
add_library(boost::sort ALIAS boost_sort)
set_property(TARGET boost_sort PROPERTY EXPORT_NAME sort)

target_include_directories(boost_sort INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_sort INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_sort INTERFACE boost::static_assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_sort INTERFACE boost::type_traits)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_sort INTERFACE boost::serialization)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_sort INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_sort EXPORT boost_sort-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_sort-targets
  FILE boost_sort-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_sort
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_sort-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_sort-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_sort-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_sort-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_sort-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_sort-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_sort-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_sort-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_sort-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_sort-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_sort-config-version.cmake"
  DESTINATION lib/cmake/boost_sort
)

