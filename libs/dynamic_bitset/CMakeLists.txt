
cmake_minimum_required(VERSION 3.5)
project(boost_dynamic_bitset)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_move)
find_package(boost_integer)
find_package(boost_serialization)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_dynamic_bitset INTERFACE
)
add_library(boost::dynamic_bitset ALIAS boost_dynamic_bitset)
set_property(TARGET boost_dynamic_bitset PROPERTY EXPORT_NAME dynamic_bitset)

target_include_directories(boost_dynamic_bitset INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::static_assert)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::move)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::integer)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::serialization)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_dynamic_bitset EXPORT boost_dynamic_bitset-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_dynamic_bitset-targets
  FILE boost_dynamic_bitset-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_dynamic_bitset
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_dynamic_bitset-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_dynamic_bitset-config-version.cmake"
  DESTINATION lib/cmake/boost_dynamic_bitset
)

