
cmake_minimum_required(VERSION 3.5)
project(boost_xpressive)
include(CMakePackageConfigHelpers)

find_package(boost_iterator)
find_package(boost_utility)
find_package(boost_static_assert)
find_package(boost_proto)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_numeric_conversion)
find_package(boost_core)
find_package(boost_mpl)
find_package(boost_conversion)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_preprocessor)
find_package(boost_integer)
find_package(boost_optional)
find_package(boost_exception)
find_package(boost_range)
find_package(boost_typeof)
find_package(boost_lexical_cast)
find_package(boost_throw_exception)

add_library(boost_xpressive INTERFACE
)
add_library(boost::xpressive ALIAS boost_xpressive)
set_property(TARGET boost_xpressive PROPERTY EXPORT_NAME xpressive)

target_include_directories(boost_xpressive INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_iterator_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::iterator)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::utility)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::static_assert)
endif()
if(boost_proto_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::proto)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::smart_ptr)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::config)
endif()
if(boost_numeric_conversion_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::numeric_conversion)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::core)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::mpl)
endif()
if(boost_conversion_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::conversion)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::assert)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::fusion)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::preprocessor)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::integer)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::optional)
endif()
if(boost_exception_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::exception)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::range)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::typeof)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::lexical_cast)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_xpressive INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_xpressive EXPORT boost_xpressive-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_xpressive-targets
  FILE boost_xpressive-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_xpressive
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_proto_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_proto)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_numeric_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_numeric_conversion)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_conversion)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_exception)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_typeof)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_xpressive-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_xpressive-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_xpressive-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_xpressive-config-version.cmake"
  DESTINATION lib/cmake/boost_xpressive
)

