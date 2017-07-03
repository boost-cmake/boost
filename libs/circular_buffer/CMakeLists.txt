
cmake_minimum_required(VERSION 3.5)
project(boost_circular_buffer)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_container)
find_package(boost_iterator)
find_package(boost_move)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

add_library(boost_circular_buffer INTERFACE
)
add_library(boost::circular_buffer ALIAS boost_circular_buffer)
set_property(TARGET boost_circular_buffer PROPERTY EXPORT_NAME circular_buffer)

target_include_directories(boost_circular_buffer INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_circular_buffer INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_circular_buffer INTERFACE boost::static_assert)
endif()
if(boost_container_FOUND)
target_link_libraries(boost_circular_buffer INTERFACE boost::container)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_circular_buffer INTERFACE boost::iterator)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_circular_buffer INTERFACE boost::move)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_circular_buffer INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_circular_buffer INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_circular_buffer INTERFACE boost::concept_check)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_circular_buffer INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_circular_buffer INTERFACE boost::throw_exception)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_circular_buffer INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_circular_buffer EXPORT boost_circular_buffer-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_circular_buffer-targets
  FILE boost_circular_buffer-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_circular_buffer
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_container_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
find_package(boost_container)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_circular_buffer-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_circular_buffer-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_circular_buffer-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_circular_buffer-config-version.cmake"
  DESTINATION lib/cmake/boost_circular_buffer
)

