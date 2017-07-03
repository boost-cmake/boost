
cmake_minimum_required(VERSION 3.5)
project(boost_functional)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_typeof)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_function_types)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_utility)

add_library(boost_functional INTERFACE
)
add_library(boost::functional ALIAS boost_functional)
set_property(TARGET boost_functional PROPERTY EXPORT_NAME functional)

target_include_directories(boost_functional INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_functional INTERFACE boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_functional INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_functional INTERFACE boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_functional INTERFACE boost::iterator)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_functional INTERFACE boost::typeof)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_functional INTERFACE boost::optional)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_functional INTERFACE boost::mpl)
endif()
if(boost_function_types_FOUND)
target_link_libraries(boost_functional INTERFACE boost::function_types)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_functional INTERFACE boost::detail)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_functional INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_functional INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_functional INTERFACE boost::preprocessor)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_functional INTERFACE boost::integer)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_functional INTERFACE boost::config)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_functional INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_functional EXPORT boost_functional-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_functional-targets
  FILE boost_functional-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_functional
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_typeof)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_function_types_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_function_types)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_functional-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_functional-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_functional-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_functional-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_functional-config-version.cmake"
  DESTINATION lib/cmake/boost_functional
)

