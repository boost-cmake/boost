
cmake_minimum_required(VERSION 3.5)
project(boost_iterator)
include(CMakePackageConfigHelpers)

find_package(boost_function_types)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_smart_ptr)
find_package(boost_conversion)
find_package(boost_config)
find_package(boost_utility)

add_library(boost_iterator INTERFACE
)
add_library(boost::iterator ALIAS boost_iterator)
set_property(TARGET boost_iterator PROPERTY EXPORT_NAME iterator)

target_include_directories(boost_iterator INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_types_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::function_types)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::static_assert)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::optional)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::mpl)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::detail)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::assert)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::fusion)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::concept_check)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::smart_ptr)
endif()
if(boost_conversion_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::conversion)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::config)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_iterator INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_iterator EXPORT boost_iterator-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_iterator-targets
  FILE boost_iterator-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_iterator
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_types_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_function_types)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_conversion)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_iterator-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_iterator-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_iterator-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_iterator-config-version.cmake"
  DESTINATION lib/cmake/boost_iterator
)

