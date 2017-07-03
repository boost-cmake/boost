
cmake_minimum_required(VERSION 3.5)
project(boost_uuid)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_winapi)
find_package(boost_random)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_io)
find_package(boost_serialization)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_uuid INTERFACE
)
add_library(boost::uuid ALIAS boost_uuid)
set_property(TARGET boost_uuid PROPERTY EXPORT_NAME uuid)

target_include_directories(boost_uuid INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::iterator)
endif()
if(boost_winapi_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::winapi)
endif()
if(boost_random_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::random)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::smart_ptr)
endif()
if(boost_io_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::io)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::serialization)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_uuid INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_uuid EXPORT boost_uuid-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_uuid-targets
  FILE boost_uuid-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_uuid
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_winapi_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_winapi)
")
endif()
if(boost_random_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_random)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_io_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_io)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_uuid-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_uuid-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_uuid-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_uuid-config-version.cmake"
  DESTINATION lib/cmake/boost_uuid
)

