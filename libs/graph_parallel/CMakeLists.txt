
cmake_minimum_required(VERSION 3.5)
project(boost_graph_parallel)
include(CMakePackageConfigHelpers)

find_package(boost_disjoint_sets)
find_package(boost_iterator)
find_package(boost_random)
find_package(boost_functional)
find_package(boost_concept_check)
find_package(boost_static_assert)
find_package(boost_property_map)
find_package(boost_graph)
find_package(boost_detail)
find_package(boost_dynamic_bitset)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_foreach)
find_package(boost_function)
find_package(boost_core)
find_package(boost_tuple)
find_package(boost_mpl)
find_package(boost_variant)
find_package(boost_mpi)
find_package(boost_assert)
find_package(boost_serialization)
find_package(boost_optional)
find_package(boost_filesystem)
find_package(boost_lexical_cast)

add_library(boost_graph_parallel 
src/mpi_process_group.cpp
src/tag_allocator.cpp
)
add_library(boost::graph_parallel ALIAS boost_graph_parallel)
set_property(TARGET boost_graph_parallel PROPERTY EXPORT_NAME graph_parallel)

target_include_directories(boost_graph_parallel PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_disjoint_sets_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::disjoint_sets)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::iterator)
endif()
if(boost_random_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::random)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::functional)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::concept_check)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::static_assert)
endif()
if(boost_property_map_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::property_map)
endif()
if(boost_graph_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::graph)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::detail)
endif()
if(boost_dynamic_bitset_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::dynamic_bitset)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::smart_ptr)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::config)
endif()
if(boost_foreach_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::foreach)
endif()
if(boost_function_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::core)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::tuple)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::mpl)
endif()
if(boost_variant_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::variant)
endif()
if(boost_mpi_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::mpi)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::assert)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::serialization)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::optional)
endif()
if(boost_filesystem_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::filesystem)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_graph_parallel PUBLIC boost::lexical_cast)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_graph_parallel EXPORT boost_graph_parallel-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_graph_parallel-targets
  FILE boost_graph_parallel-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_graph_parallel
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_disjoint_sets_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_disjoint_sets)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_random_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_random)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_property_map_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_property_map)
")
endif()
if(boost_graph_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_graph)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_dynamic_bitset_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_dynamic_bitset)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_foreach_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_foreach)
")
endif()
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_variant_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_variant)
")
endif()
if(boost_mpi_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_mpi)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_filesystem_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_filesystem)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
find_package(boost_lexical_cast)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_graph_parallel-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_graph_parallel-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_graph_parallel-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_graph_parallel-config-version.cmake"
  DESTINATION lib/cmake/boost_graph_parallel
)

