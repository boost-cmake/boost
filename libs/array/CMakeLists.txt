
cmake_minimum_required(VERSION 3.5)
project(boost_array)
include(CMakePackageConfigHelpers)

find_package(boost_assert)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_array INTERFACE
)
add_library(boost::array ALIAS boost_array)
set_property(TARGET boost_array PROPERTY EXPORT_NAME array)

target_include_directories(boost_array INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_assert_FOUND)
target_link_libraries(boost_array INTERFACE boost::assert)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_array INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_array INTERFACE boost::static_assert)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_array INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_array INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_array EXPORT boost_array-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_array-targets
  FILE boost_array-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_array
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_array-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_array-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_array-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_array-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_array-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_array-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_array-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_array-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_array-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_array-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_array-config-version.cmake"
  DESTINATION lib/cmake/boost_array
)

