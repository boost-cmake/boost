
cmake_minimum_required(VERSION 3.5)
project(boost_variant)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_detail)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_type_index)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_math)
find_package(boost_utility)

add_library(boost_variant INTERFACE
)
add_library(boost::variant ALIAS boost_variant)
set_property(TARGET boost_variant PROPERTY EXPORT_NAME variant)

target_include_directories(boost_variant INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_variant INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_variant INTERFACE boost::static_assert)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_variant INTERFACE boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_variant INTERFACE boost::mpl)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_variant INTERFACE boost::move)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_variant INTERFACE boost::detail)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_variant INTERFACE boost::functional)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_variant INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_variant INTERFACE boost::type_traits)
endif()
if(boost_type_index_FOUND)
target_link_libraries(boost_variant INTERFACE boost::type_index)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_variant INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_variant INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_variant INTERFACE boost::throw_exception)
endif()
if(boost_math_FOUND)
target_link_libraries(boost_variant INTERFACE boost::math)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_variant INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_variant EXPORT boost_variant-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_variant-targets
  FILE boost_variant-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_variant
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_type_index_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_type_index)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_math_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_math)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_variant-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_variant-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_variant-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_variant-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_variant-config-version.cmake"
  DESTINATION lib/cmake/boost_variant
)

