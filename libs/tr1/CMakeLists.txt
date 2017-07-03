
cmake_minimum_required(VERSION 3.5)
project(boost_tr1)
include(CMakePackageConfigHelpers)

find_package(boost_regex)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_function)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_random)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_array)
find_package(boost_config)
find_package(boost_unordered)
find_package(boost_math)
find_package(boost_utility)

add_library(boost_tr1 INTERFACE
)
add_library(boost::tr1 ALIAS boost_tr1)
set_property(TARGET boost_tr1 PROPERTY EXPORT_NAME tr1)

target_include_directories(boost_tr1 INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_regex_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::regex)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::iterator)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::tuple)
endif()
if(boost_function_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::function)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::mpl)
endif()
if(boost_random_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::random)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::functional)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::assert)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::fusion)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::smart_ptr)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::array)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::config)
endif()
if(boost_unordered_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::unordered)
endif()
if(boost_math_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::math)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_tr1 INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_tr1 EXPORT boost_tr1-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_tr1-targets
  FILE boost_tr1-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_tr1
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_regex_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_regex)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_random_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_random)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_unordered_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_unordered)
")
endif()
if(boost_math_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_math)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_tr1-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_tr1-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_tr1-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_tr1-config-version.cmake"
  DESTINATION lib/cmake/boost_tr1
)

