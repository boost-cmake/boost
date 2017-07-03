
cmake_minimum_required(VERSION 3.5)
project(boost_range)
include(CMakePackageConfigHelpers)

find_package(boost_regex)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_functional)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_preprocessor)
find_package(boost_array)
find_package(boost_config)
find_package(boost_numeric_conversion)
find_package(boost_utility)

add_library(boost_range INTERFACE
)
add_library(boost::range ALIAS boost_range)
set_property(TARGET boost_range PROPERTY EXPORT_NAME range)

target_include_directories(boost_range INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_regex_FOUND)
target_link_libraries(boost_range INTERFACE boost::regex)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_range INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_range INTERFACE boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_range INTERFACE boost::iterator)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_range INTERFACE boost::tuple)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_range INTERFACE boost::optional)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_range INTERFACE boost::mpl)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_range INTERFACE boost::functional)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_range INTERFACE boost::detail)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_range INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_range INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_range INTERFACE boost::concept_check)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_range INTERFACE boost::preprocessor)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_range INTERFACE boost::array)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_range INTERFACE boost::config)
endif()
if(boost_numeric_conversion_FOUND)
target_link_libraries(boost_range INTERFACE boost::numeric_conversion)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_range INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_range EXPORT boost_range-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_range-targets
  FILE boost_range-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_range
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_regex_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_regex)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_numeric_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_numeric_conversion)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_range-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_range-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_range-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_range-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_range-config-version.cmake"
  DESTINATION lib/cmake/boost_range
)

