
cmake_minimum_required(VERSION 3.5)
project(boost_wave)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_multi_index)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_preprocessor)
find_package(boost_filesystem)
find_package(boost_serialization)
find_package(boost_throw_exception)
find_package(boost_config)
find_package(boost_spirit)
find_package(boost_pool)
find_package(boost_smart_ptr)

add_library(boost_wave 
src/token_ids.cpp
src/instantiate_defined_grammar.cpp
src/instantiate_re2c_lexer_str.cpp
src/instantiate_cpp_exprgrammar.cpp
src/instantiate_cpp_literalgrs.cpp
src/instantiate_re2c_lexer.cpp
src/wave_config_constant.cpp
src/instantiate_predef_macros.cpp
src/instantiate_cpp_grammar.cpp
)
add_library(boost::wave ALIAS boost_wave)
set_property(TARGET boost_wave PROPERTY EXPORT_NAME wave)

target_include_directories(boost_wave PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_wave PUBLIC boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_wave PUBLIC boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_wave PUBLIC boost::iterator)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_wave PUBLIC boost::mpl)
endif()
if(boost_multi_index_FOUND)
target_link_libraries(boost_wave PUBLIC boost::multi_index)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_wave PUBLIC boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_wave PUBLIC boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_wave PUBLIC boost::concept_check)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_wave PUBLIC boost::preprocessor)
endif()
if(boost_filesystem_FOUND)
target_link_libraries(boost_wave PUBLIC boost::filesystem)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_wave PUBLIC boost::serialization)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_wave PUBLIC boost::throw_exception)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_wave PUBLIC boost::config)
endif()
if(boost_spirit_FOUND)
target_link_libraries(boost_wave PUBLIC boost::spirit)
endif()
if(boost_pool_FOUND)
target_link_libraries(boost_wave PUBLIC boost::pool)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_wave PUBLIC boost::smart_ptr)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_wave EXPORT boost_wave-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_wave-targets
  FILE boost_wave-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_wave
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_multi_index_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_multi_index)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_filesystem_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_filesystem)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_spirit_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_spirit)
")
endif()
if(boost_pool_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_pool)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
find_package(boost_smart_ptr)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_wave-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_wave-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_wave-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_wave-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_wave-config-version.cmake"
  DESTINATION lib/cmake/boost_wave
)

