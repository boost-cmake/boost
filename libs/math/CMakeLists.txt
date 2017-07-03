
cmake_minimum_required(VERSION 3.5)
project(boost_math)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_utility)
find_package(boost_predef)
find_package(boost_tuple)
find_package(boost_mpl)
find_package(boost_array)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_smart_ptr)
find_package(boost_range)
find_package(boost_lexical_cast)
find_package(boost_lambda)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_atomic)

add_library(boost_math INTERFACE
)
add_library(boost::math ALIAS boost_math)
set_property(TARGET boost_math PROPERTY EXPORT_NAME math)

target_include_directories(boost_math INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_math INTERFACE boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_math INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_math INTERFACE boost::static_assert)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_math INTERFACE boost::utility)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_math INTERFACE boost::predef)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_math INTERFACE boost::tuple)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_math INTERFACE boost::mpl)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_math INTERFACE boost::array)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_math INTERFACE boost::detail)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_math INTERFACE boost::assert)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_math INTERFACE boost::fusion)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_math INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_math INTERFACE boost::concept_check)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_math INTERFACE boost::smart_ptr)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_math INTERFACE boost::range)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_math INTERFACE boost::lexical_cast)
endif()
if(boost_lambda_FOUND)
target_link_libraries(boost_math INTERFACE boost::lambda)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_math INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_math INTERFACE boost::throw_exception)
endif()
if(boost_atomic_FOUND)
target_link_libraries(boost_math INTERFACE boost::atomic)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_math EXPORT boost_math-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_math-targets
  FILE boost_math-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_math
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_lambda_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_lambda)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_atomic_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
find_package(boost_atomic)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_math-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_math-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_math-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_math-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_math-config-version.cmake"
  DESTINATION lib/cmake/boost_math
)

