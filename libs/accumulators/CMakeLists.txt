
cmake_minimum_required(VERSION 3.5)
project(boost_accumulators)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_numeric_ublas)
find_package(boost_parameter)
find_package(boost_mpl)
find_package(boost_range)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_preprocessor)
find_package(boost_circular_buffer)
find_package(boost_array)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_numeric_conversion)
find_package(boost_typeof)

add_library(boost_accumulators INTERFACE
)
add_library(boost::accumulators ALIAS boost_accumulators)
set_property(TARGET boost_accumulators PROPERTY EXPORT_NAME accumulators)

target_include_directories(boost_accumulators INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::iterator)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::tuple)
endif()
if(boost_numeric_ublas_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::numeric_ublas)
endif()
if(boost_parameter_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::parameter)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::mpl)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::range)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::assert)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::fusion)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::concept_check)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::preprocessor)
endif()
if(boost_circular_buffer_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::circular_buffer)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::array)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::throw_exception)
endif()
if(boost_numeric_conversion_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::numeric_conversion)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_accumulators INTERFACE boost::typeof)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_accumulators EXPORT boost_accumulators-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_accumulators-targets
  FILE boost_accumulators-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_accumulators
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_numeric_ublas_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_numeric_ublas)
")
endif()
if(boost_parameter_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_parameter)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_circular_buffer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_circular_buffer)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_numeric_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_numeric_conversion)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
find_package(boost_typeof)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_accumulators-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_accumulators-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_accumulators-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_accumulators-config-version.cmake"
  DESTINATION lib/cmake/boost_accumulators
)

