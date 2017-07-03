
cmake_minimum_required(VERSION 3.5)
project(boost_bimap)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_property_map)
find_package(boost_mpl)
find_package(boost_multi_index)
find_package(boost_functional)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_preprocessor)
find_package(boost_serialization)
find_package(boost_lambda)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

add_library(boost_bimap INTERFACE
)
add_library(boost::bimap ALIAS boost_bimap)
set_property(TARGET boost_bimap PROPERTY EXPORT_NAME bimap)

target_include_directories(boost_bimap INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::iterator)
endif()
if(boost_property_map_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::property_map)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::mpl)
endif()
if(boost_multi_index_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::multi_index)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::functional)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::concept_check)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::preprocessor)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::serialization)
endif()
if(boost_lambda_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::lambda)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::throw_exception)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_bimap INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_bimap EXPORT boost_bimap-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_bimap-targets
  FILE boost_bimap-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_bimap
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_property_map_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_property_map)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_multi_index_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_multi_index)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_lambda_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_lambda)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_bimap-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_bimap-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_bimap-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_bimap-config-version.cmake"
  DESTINATION lib/cmake/boost_bimap
)

