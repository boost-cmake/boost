
cmake_minimum_required(VERSION 3.5)
project(boost_type_index)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_preprocessor)
find_package(boost_type_traits)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_smart_ptr)

add_library(boost_type_index INTERFACE
)
add_library(boost::type_index ALIAS boost_type_index)
set_property(TARGET boost_type_index PROPERTY EXPORT_NAME type_index)

target_include_directories(boost_type_index INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_type_index INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_type_index INTERFACE boost::static_assert)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_type_index INTERFACE boost::mpl)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_type_index INTERFACE boost::preprocessor)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_type_index INTERFACE boost::type_traits)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_type_index INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_type_index INTERFACE boost::throw_exception)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_type_index INTERFACE boost::smart_ptr)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_type_index EXPORT boost_type_index-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_type_index-targets
  FILE boost_type_index-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_type_index
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_type_index-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_index-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_index-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_index-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_index-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_index-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_index-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_index-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_index-config.cmake" "
find_package(boost_smart_ptr)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_type_index-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_type_index-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_type_index-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_type_index-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_type_index-config-version.cmake"
  DESTINATION lib/cmake/boost_type_index
)

