
cmake_minimum_required(VERSION 3.5)
project(boost_signals2)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_preprocessor)
find_package(boost_predef)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_variant)
find_package(boost_multi_index)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_bind)
find_package(boost_parameter)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_signals2 INTERFACE
)
add_library(boost::signals2 ALIAS boost_signals2)
set_property(TARGET boost_signals2 PROPERTY EXPORT_NAME signals2)

target_include_directories(boost_signals2 INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::core)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::preprocessor)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::predef)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::iterator)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::tuple)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::optional)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::mpl)
endif()
if(boost_variant_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::variant)
endif()
if(boost_multi_index_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::multi_index)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::smart_ptr)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::bind)
endif()
if(boost_parameter_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::parameter)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_signals2 INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_signals2 EXPORT boost_signals2-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_signals2-targets
  FILE boost_signals2-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_signals2
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_variant_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_variant)
")
endif()
if(boost_multi_index_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_multi_index)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_parameter_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_parameter)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_signals2-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_signals2-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_signals2-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_signals2-config-version.cmake"
  DESTINATION lib/cmake/boost_signals2
)

