
cmake_minimum_required(VERSION 3.5)
project(boost_fusion)
include(CMakePackageConfigHelpers)

find_package(boost_function_types)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_tuple)
find_package(boost_mpl)
find_package(boost_functional)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_typeof)

add_library(boost_fusion INTERFACE
)
add_library(boost::fusion ALIAS boost_fusion)
set_property(TARGET boost_fusion PROPERTY EXPORT_NAME fusion)

target_include_directories(boost_fusion INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_types_FOUND)
target_link_libraries(boost_fusion INTERFACE boost::function_types)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_fusion INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_fusion INTERFACE boost::static_assert)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_fusion INTERFACE boost::tuple)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_fusion INTERFACE boost::mpl)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_fusion INTERFACE boost::functional)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_fusion INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_fusion INTERFACE boost::preprocessor)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_fusion INTERFACE boost::utility)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_fusion INTERFACE boost::config)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_fusion INTERFACE boost::typeof)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_fusion EXPORT boost_fusion-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_fusion-targets
  FILE boost_fusion-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_fusion
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_types_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
find_package(boost_function_types)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
find_package(boost_typeof)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_fusion-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_fusion-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_fusion-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_fusion-config-version.cmake"
  DESTINATION lib/cmake/boost_fusion
)

