
cmake_minimum_required(VERSION 3.5)
project(boost_property_tree)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_format)
find_package(boost_multi_index)
find_package(boost_any)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_bind)
find_package(boost_serialization)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

add_library(boost_property_tree INTERFACE
)
add_library(boost::property_tree ALIAS boost_property_tree)
set_property(TARGET boost_property_tree PROPERTY EXPORT_NAME property_tree)

target_include_directories(boost_property_tree INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::iterator)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::optional)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::mpl)
endif()
if(boost_format_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::format)
endif()
if(boost_multi_index_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::multi_index)
endif()
if(boost_any_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::any)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::assert)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::type_traits)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::bind)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::serialization)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::throw_exception)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_property_tree INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_property_tree EXPORT boost_property_tree-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_property_tree-targets
  FILE boost_property_tree-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_property_tree
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_format_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_format)
")
endif()
if(boost_multi_index_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_multi_index)
")
endif()
if(boost_any_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_any)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_property_tree-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_property_tree-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_property_tree-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_property_tree-config-version.cmake"
  DESTINATION lib/cmake/boost_property_tree
)

