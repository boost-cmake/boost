
cmake_minimum_required(VERSION 3.5)
project(boost_algorithm)
include(CMakePackageConfigHelpers)

find_package(boost_regex)
find_package(boost_core)
find_package(boost_exception)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_function)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_static_assert)
find_package(boost_unordered)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_array)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_algorithm INTERFACE
)
add_library(boost::algorithm ALIAS boost_algorithm)
set_property(TARGET boost_algorithm PROPERTY EXPORT_NAME algorithm)

target_include_directories(boost_algorithm INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_regex_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::regex)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::core)
endif()
if(boost_exception_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::exception)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::iterator)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::tuple)
endif()
if(boost_function_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::function)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::mpl)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::static_assert)
endif()
if(boost_unordered_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::unordered)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::assert)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::concept_check)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::array)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_algorithm INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_algorithm EXPORT boost_algorithm-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_algorithm-targets
  FILE boost_algorithm-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_algorithm
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_regex_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_regex)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_exception)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_unordered_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_unordered)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_algorithm-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_algorithm-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_algorithm-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_algorithm-config-version.cmake"
  DESTINATION lib/cmake/boost_algorithm
)

