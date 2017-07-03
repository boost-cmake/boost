
cmake_minimum_required(VERSION 3.5)
project(boost_geometry)
include(CMakePackageConfigHelpers)

find_package(boost_qvm)
find_package(boost_tokenizer)
find_package(boost_move)
find_package(boost_concept_check)
find_package(boost_serialization)
find_package(boost_array)
find_package(boost_iterator)
find_package(boost_utility)
find_package(boost_static_assert)
find_package(boost_multiprecision)
find_package(boost_container)
find_package(boost_polygon)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_rational)
find_package(boost_config)
find_package(boost_math)
find_package(boost_core)
find_package(boost_tuple)
find_package(boost_mpl)
find_package(boost_variant)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_integer)
find_package(boost_function_types)
find_package(boost_algorithm)
find_package(boost_range)
find_package(boost_numeric_conversion)
find_package(boost_lexical_cast)
find_package(boost_throw_exception)

add_library(boost_geometry INTERFACE
)
add_library(boost::geometry ALIAS boost_geometry)
set_property(TARGET boost_geometry PROPERTY EXPORT_NAME geometry)

target_include_directories(boost_geometry INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_qvm_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::qvm)
endif()
if(boost_tokenizer_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::tokenizer)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::move)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::concept_check)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::serialization)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::array)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::iterator)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::utility)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::static_assert)
endif()
if(boost_multiprecision_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::multiprecision)
endif()
if(boost_container_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::container)
endif()
if(boost_polygon_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::polygon)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::smart_ptr)
endif()
if(boost_rational_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::rational)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::config)
endif()
if(boost_math_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::math)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::core)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::tuple)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::mpl)
endif()
if(boost_variant_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::variant)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::assert)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::fusion)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::integer)
endif()
if(boost_function_types_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::function_types)
endif()
if(boost_algorithm_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::algorithm)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::range)
endif()
if(boost_numeric_conversion_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::numeric_conversion)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::lexical_cast)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_geometry INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_geometry EXPORT boost_geometry-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_geometry-targets
  FILE boost_geometry-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_geometry
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_qvm_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_qvm)
")
endif()
if(boost_tokenizer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_tokenizer)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_multiprecision_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_multiprecision)
")
endif()
if(boost_container_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_container)
")
endif()
if(boost_polygon_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_polygon)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_rational_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_rational)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_math_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_math)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_variant_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_variant)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_function_types_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_function_types)
")
endif()
if(boost_algorithm_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_algorithm)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_numeric_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_numeric_conversion)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_geometry-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_geometry-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_geometry-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_geometry-config-version.cmake"
  DESTINATION lib/cmake/boost_geometry
)

