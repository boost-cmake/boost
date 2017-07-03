
cmake_minimum_required(VERSION 3.5)
project(boost_unordered)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_container)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_move)
find_package(boost_functional)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_throw_exception)
find_package(boost_preprocessor)
find_package(boost_type_traits)
find_package(boost_config)
find_package(boost_smart_ptr)

add_library(boost_unordered INTERFACE
)
add_library(boost::unordered ALIAS boost_unordered)
set_property(TARGET boost_unordered PROPERTY EXPORT_NAME unordered)

target_include_directories(boost_unordered INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::core)
endif()
if(boost_container_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::container)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::iterator)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::tuple)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::move)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::functional)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::detail)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::assert)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::throw_exception)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::preprocessor)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::type_traits)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::config)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_unordered INTERFACE boost::smart_ptr)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_unordered EXPORT boost_unordered-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_unordered-targets
  FILE boost_unordered-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_unordered
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_container_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_container)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
find_package(boost_smart_ptr)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_unordered-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_unordered-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_unordered-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_unordered-config-version.cmake"
  DESTINATION lib/cmake/boost_unordered
)

