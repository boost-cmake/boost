
cmake_minimum_required(VERSION 3.5)
project(boost_atomic)
include(CMakePackageConfigHelpers)

find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_config)

add_library(boost_atomic 
src/lockpool.cpp
)
add_library(boost::atomic ALIAS boost_atomic)
set_property(TARGET boost_atomic PROPERTY EXPORT_NAME atomic)

target_include_directories(boost_atomic PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_assert_FOUND)
target_link_libraries(boost_atomic PUBLIC boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_atomic PUBLIC boost::type_traits)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_atomic PUBLIC boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_atomic EXPORT boost_atomic-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_atomic-targets
  FILE boost_atomic-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_atomic
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_atomic-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_atomic-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_atomic-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_atomic-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_atomic-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_atomic-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_atomic-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_atomic-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_atomic-config-version.cmake"
  DESTINATION lib/cmake/boost_atomic
)

