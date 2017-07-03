
cmake_minimum_required(VERSION 3.5)
project(boost_assign)
include(CMakePackageConfigHelpers)

find_package(boost_static_assert)
find_package(boost_tuple)
find_package(boost_mpl)
find_package(boost_range)
find_package(boost_ptr_container)
find_package(boost_type_traits)
find_package(boost_array)
find_package(boost_config)
find_package(boost_preprocessor)

add_library(boost_assign INTERFACE
)
add_library(boost::assign ALIAS boost_assign)
set_property(TARGET boost_assign PROPERTY EXPORT_NAME assign)

target_include_directories(boost_assign INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_static_assert_FOUND)
target_link_libraries(boost_assign INTERFACE boost::static_assert)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_assign INTERFACE boost::tuple)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_assign INTERFACE boost::mpl)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_assign INTERFACE boost::range)
endif()
if(boost_ptr_container_FOUND)
target_link_libraries(boost_assign INTERFACE boost::ptr_container)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_assign INTERFACE boost::type_traits)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_assign INTERFACE boost::array)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_assign INTERFACE boost::config)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_assign INTERFACE boost::preprocessor)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_assign EXPORT boost_assign-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_assign-targets
  FILE boost_assign-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_assign
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_assign-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_assign-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_assign-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_assign-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_assign-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_ptr_container_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_assign-config.cmake" "
find_package(boost_ptr_container)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_assign-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_assign-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_assign-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_assign-config.cmake" "
find_package(boost_preprocessor)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_assign-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_assign-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_assign-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_assign-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_assign-config-version.cmake"
  DESTINATION lib/cmake/boost_assign
)

