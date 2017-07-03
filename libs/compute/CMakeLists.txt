
cmake_minimum_required(VERSION 3.5)
project(boost_compute)
include(CMakePackageConfigHelpers)

find_package(boost_iterator)
find_package(boost_property_tree)
find_package(boost_array)
find_package(boost_utility)
find_package(boost_static_assert)
find_package(boost_uuid)
find_package(boost_proto)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_function)
find_package(boost_core)
find_package(boost_tuple)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_preprocessor)
find_package(boost_optional)
find_package(boost_function_types)
find_package(boost_thread)
find_package(boost_algorithm)
find_package(boost_chrono)
find_package(boost_range)
find_package(boost_typeof)
find_package(boost_filesystem)
find_package(boost_lexical_cast)
find_package(boost_throw_exception)

add_library(boost_compute INTERFACE
)
add_library(boost::compute ALIAS boost_compute)
set_property(TARGET boost_compute PROPERTY EXPORT_NAME compute)

target_include_directories(boost_compute INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_iterator_FOUND)
target_link_libraries(boost_compute INTERFACE boost::iterator)
endif()
if(boost_property_tree_FOUND)
target_link_libraries(boost_compute INTERFACE boost::property_tree)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_compute INTERFACE boost::array)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_compute INTERFACE boost::utility)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_compute INTERFACE boost::static_assert)
endif()
if(boost_uuid_FOUND)
target_link_libraries(boost_compute INTERFACE boost::uuid)
endif()
if(boost_proto_FOUND)
target_link_libraries(boost_compute INTERFACE boost::proto)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_compute INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_compute INTERFACE boost::smart_ptr)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_compute INTERFACE boost::config)
endif()
if(boost_function_FOUND)
target_link_libraries(boost_compute INTERFACE boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_compute INTERFACE boost::core)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_compute INTERFACE boost::tuple)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_compute INTERFACE boost::mpl)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_compute INTERFACE boost::assert)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_compute INTERFACE boost::fusion)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_compute INTERFACE boost::preprocessor)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_compute INTERFACE boost::optional)
endif()
if(boost_function_types_FOUND)
target_link_libraries(boost_compute INTERFACE boost::function_types)
endif()
if(boost_thread_FOUND)
target_link_libraries(boost_compute INTERFACE boost::thread)
endif()
if(boost_algorithm_FOUND)
target_link_libraries(boost_compute INTERFACE boost::algorithm)
endif()
if(boost_chrono_FOUND)
target_link_libraries(boost_compute INTERFACE boost::chrono)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_compute INTERFACE boost::range)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_compute INTERFACE boost::typeof)
endif()
if(boost_filesystem_FOUND)
target_link_libraries(boost_compute INTERFACE boost::filesystem)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_compute INTERFACE boost::lexical_cast)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_compute INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_compute EXPORT boost_compute-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_compute-targets
  FILE boost_compute-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_compute
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_property_tree_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_property_tree)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_uuid_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_uuid)
")
endif()
if(boost_proto_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_proto)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_function_types_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_function_types)
")
endif()
if(boost_thread_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_thread)
")
endif()
if(boost_algorithm_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_algorithm)
")
endif()
if(boost_chrono_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_chrono)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_typeof)
")
endif()
if(boost_filesystem_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_filesystem)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_compute-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_compute-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_compute-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_compute-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_compute-config-version.cmake"
  DESTINATION lib/cmake/boost_compute
)

