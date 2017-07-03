
cmake_minimum_required(VERSION 3.5)
project(boost_python)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_smart_ptr)
find_package(boost_detail)
find_package(boost_property_map)
find_package(boost_type_traits)
find_package(boost_graph)
find_package(boost_preprocessor)
find_package(boost_conversion)
find_package(boost_foreach)
find_package(boost_integer)
find_package(boost_lexical_cast)
find_package(boost_config)
find_package(boost_numeric_conversion)
find_package(boost_utility)

add_library(boost_python 
src/slice.cpp
src/str.cpp
src/object_operators.cpp
src/tuple.cpp
src/object_protocol.cpp
src/numeric.cpp
src/errors.cpp
src/import.cpp
src/exec.cpp
src/wrapper.cpp
src/list.cpp
src/module.cpp
src/long.cpp
src/dict.cpp
)
add_library(boost::python ALIAS boost_python)
set_property(TARGET boost_python PROPERTY EXPORT_NAME python)

target_include_directories(boost_python PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_python PUBLIC boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_python PUBLIC boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_python PUBLIC boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_python PUBLIC boost::iterator)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_python PUBLIC boost::tuple)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_python PUBLIC boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_python PUBLIC boost::mpl)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_python PUBLIC boost::smart_ptr)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_python PUBLIC boost::detail)
endif()
if(boost_property_map_FOUND)
target_link_libraries(boost_python PUBLIC boost::property_map)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_python PUBLIC boost::type_traits)
endif()
if(boost_graph_FOUND)
target_link_libraries(boost_python PUBLIC boost::graph)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_python PUBLIC boost::preprocessor)
endif()
if(boost_conversion_FOUND)
target_link_libraries(boost_python PUBLIC boost::conversion)
endif()
if(boost_foreach_FOUND)
target_link_libraries(boost_python PUBLIC boost::foreach)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_python PUBLIC boost::integer)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_python PUBLIC boost::lexical_cast)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_python PUBLIC boost::config)
endif()
if(boost_numeric_conversion_FOUND)
target_link_libraries(boost_python PUBLIC boost::numeric_conversion)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_python PUBLIC boost::utility)
endif()

find_package(PythonLibs)
target_link_libraries(boost_python PUBLIC ${PYTHON_LIBRARIES})
target_include_directories(boost_python PUBLIC ${PYTHON_INCLUDE_DIRS})



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_python EXPORT boost_python-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_python-targets
  FILE boost_python-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_python
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_property_map_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_property_map)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_graph_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_graph)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_conversion)
")
endif()
if(boost_foreach_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_foreach)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_numeric_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_numeric_conversion)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_python-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_python-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_python-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_python-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_python-config-version.cmake"
  DESTINATION lib/cmake/boost_python
)

