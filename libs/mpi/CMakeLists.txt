
cmake_minimum_required(VERSION 3.5)
project(boost_mpi)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_python)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_property_map)
find_package(boost_integer)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_graph)
find_package(boost_serialization)
find_package(boost_lexical_cast)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

add_library(boost_mpi 
src/exception.cpp
src/environment.cpp
src/broadcast.cpp
src/timer.cpp
src/text_skeleton_oarchive.cpp
src/group.cpp
src/graph_communicator.cpp
src/packed_oarchive.cpp
src/content_oarchive.cpp
src/packed_skeleton_oarchive.cpp
src/packed_skeleton_iarchive.cpp
src/point_to_point.cpp
src/request.cpp
src/mpi_datatype_oarchive.cpp
src/mpi_datatype_cache.cpp
src/intercommunicator.cpp
src/computation_tree.cpp
src/packed_iarchive.cpp
src/communicator.cpp
)
add_library(boost::mpi ALIAS boost_mpi)
set_property(TARGET boost_mpi PROPERTY EXPORT_NAME mpi)

target_include_directories(boost_mpi PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::iterator)
endif()
if(boost_python_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::python)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::optional)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::mpl)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::assert)
endif()
if(boost_property_map_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::property_map)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::integer)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::smart_ptr)
endif()
if(boost_graph_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::graph)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::serialization)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::lexical_cast)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::throw_exception)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_mpi PUBLIC boost::utility)
endif()

find_package(MPI)
target_include_directories(boost_mpi PUBLIC ${MPI_CXX_INCLUDE_PATH})

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_mpi EXPORT boost_mpi-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_mpi-targets
  FILE boost_mpi-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_mpi
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_python_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_python)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_property_map_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_property_map)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_graph_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_graph)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_mpi-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_mpi-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_mpi-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_mpi-config-version.cmake"
  DESTINATION lib/cmake/boost_mpi
)

