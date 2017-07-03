
cmake_minimum_required(VERSION 3.5)
project(boost_smart_ptr)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_move)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_smart_ptr INTERFACE
)
add_library(boost::smart_ptr ALIAS boost_smart_ptr)
set_property(TARGET boost_smart_ptr PROPERTY EXPORT_NAME smart_ptr)

target_include_directories(boost_smart_ptr INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_smart_ptr INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_smart_ptr INTERFACE boost::static_assert)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_smart_ptr INTERFACE boost::predef)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_smart_ptr INTERFACE boost::move)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_smart_ptr INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_smart_ptr INTERFACE boost::type_traits)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_smart_ptr INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_smart_ptr INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_smart_ptr EXPORT boost_smart_ptr-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_smart_ptr-targets
  FILE boost_smart_ptr-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_smart_ptr
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_smart_ptr-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_smart_ptr-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_smart_ptr-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_smart_ptr-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_smart_ptr-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_smart_ptr-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_smart_ptr-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_smart_ptr-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_smart_ptr-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_smart_ptr-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_smart_ptr-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_smart_ptr-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_smart_ptr-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_smart_ptr-config-version.cmake"
  DESTINATION lib/cmake/boost_smart_ptr
)

