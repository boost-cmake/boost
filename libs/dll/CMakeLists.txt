
cmake_minimum_required(VERSION 3.5)
project(boost_dll)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_winapi)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_type_index)
find_package(boost_system)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_spirit)
find_package(boost_filesystem)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_dll INTERFACE
)
add_library(boost::dll ALIAS boost_dll)
set_property(TARGET boost_dll PROPERTY EXPORT_NAME dll)

target_include_directories(boost_dll INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_dll INTERFACE boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_dll INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_dll INTERFACE boost::static_assert)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_dll INTERFACE boost::predef)
endif()
if(boost_winapi_FOUND)
target_link_libraries(boost_dll INTERFACE boost::winapi)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_dll INTERFACE boost::mpl)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_dll INTERFACE boost::move)
endif()
if(boost_type_index_FOUND)
target_link_libraries(boost_dll INTERFACE boost::type_index)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_dll INTERFACE boost::system)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_dll INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_dll INTERFACE boost::smart_ptr)
endif()
if(boost_spirit_FOUND)
target_link_libraries(boost_dll INTERFACE boost::spirit)
endif()
if(boost_filesystem_FOUND)
target_link_libraries(boost_dll INTERFACE boost::filesystem)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_dll INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_dll INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_dll EXPORT boost_dll-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_dll-targets
  FILE boost_dll-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_dll
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_winapi_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_winapi)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_type_index_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_type_index)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_spirit_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_spirit)
")
endif()
if(boost_filesystem_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_filesystem)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_dll-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_dll-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_dll-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_dll-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_dll-config-version.cmake"
  DESTINATION lib/cmake/boost_dll
)

