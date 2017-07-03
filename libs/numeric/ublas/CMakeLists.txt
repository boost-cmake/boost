
cmake_minimum_required(VERSION 3.5)
project(boost_numeric_ublas)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_static_assert)
find_package(boost_numeric_interval)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_smart_ptr)
find_package(boost_serialization)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_typeof)

add_library(boost_numeric_ublas INTERFACE
)
add_library(boost::numeric_ublas ALIAS boost_numeric_ublas)
set_property(TARGET boost_numeric_ublas PROPERTY EXPORT_NAME numeric_ublas)

target_include_directories(boost_numeric_ublas INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::core)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::iterator)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::mpl)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::static_assert)
endif()
if(boost_numeric_interval_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::numeric_interval)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::concept_check)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::smart_ptr)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::serialization)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::utility)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::config)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_numeric_ublas INTERFACE boost::typeof)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_numeric_ublas EXPORT boost_numeric_ublas-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_numeric_ublas-targets
  FILE boost_numeric_ublas-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_numeric_ublas
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_numeric_interval_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_numeric_interval)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
find_package(boost_typeof)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_numeric_ublas-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_numeric_ublas-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_numeric_ublas-config-version.cmake"
  DESTINATION lib/cmake/boost_numeric_ublas
)

