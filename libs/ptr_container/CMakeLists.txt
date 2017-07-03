
cmake_minimum_required(VERSION 3.5)
project(boost_ptr_container)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_smart_ptr)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_circular_buffer)
find_package(boost_serialization)
find_package(boost_array)
find_package(boost_config)
find_package(boost_unordered)
find_package(boost_utility)

add_library(boost_ptr_container INTERFACE
)
add_library(boost::ptr_container ALIAS boost_ptr_container)
set_property(TARGET boost_ptr_container PROPERTY EXPORT_NAME ptr_container)

target_include_directories(boost_ptr_container INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::iterator)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::mpl)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::smart_ptr)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::assert)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::type_traits)
endif()
if(boost_circular_buffer_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::circular_buffer)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::serialization)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::array)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::config)
endif()
if(boost_unordered_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::unordered)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_ptr_container INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_ptr_container EXPORT boost_ptr_container-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_ptr_container-targets
  FILE boost_ptr_container-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_ptr_container
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_circular_buffer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_circular_buffer)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_unordered_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_unordered)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_ptr_container-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_ptr_container-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_ptr_container-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_ptr_container-config-version.cmake"
  DESTINATION lib/cmake/boost_ptr_container
)

