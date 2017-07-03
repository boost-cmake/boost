
cmake_minimum_required(VERSION 3.5)
project(boost_multi_array)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_array)
find_package(boost_config)

add_library(boost_multi_array INTERFACE
)
add_library(boost::multi_array ALIAS boost_multi_array)
set_property(TARGET boost_multi_array PROPERTY EXPORT_NAME multi_array)

target_include_directories(boost_multi_array INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_multi_array INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_multi_array INTERFACE boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_multi_array INTERFACE boost::iterator)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_multi_array INTERFACE boost::mpl)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_multi_array INTERFACE boost::functional)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_multi_array INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_multi_array INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_multi_array INTERFACE boost::concept_check)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_multi_array INTERFACE boost::array)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_multi_array INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_multi_array EXPORT boost_multi_array-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_multi_array-targets
  FILE boost_multi_array-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_multi_array
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_multi_array-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_multi_array-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_multi_array-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_multi_array-config-version.cmake"
  DESTINATION lib/cmake/boost_multi_array
)

