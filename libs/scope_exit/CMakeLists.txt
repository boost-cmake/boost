
cmake_minimum_required(VERSION 3.5)
project(boost_scope_exit)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_typeof)
find_package(boost_config)
find_package(boost_preprocessor)

add_library(boost_scope_exit INTERFACE
)
add_library(boost::scope_exit ALIAS boost_scope_exit)
set_property(TARGET boost_scope_exit PROPERTY EXPORT_NAME scope_exit)

target_include_directories(boost_scope_exit INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_scope_exit INTERFACE boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_scope_exit INTERFACE boost::core)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_scope_exit INTERFACE boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_scope_exit INTERFACE boost::type_traits)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_scope_exit INTERFACE boost::typeof)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_scope_exit INTERFACE boost::config)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_scope_exit INTERFACE boost::preprocessor)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_scope_exit EXPORT boost_scope_exit-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_scope_exit-targets
  FILE boost_scope_exit-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_scope_exit
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_scope_exit-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_scope_exit-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_scope_exit-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_scope_exit-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_scope_exit-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_scope_exit-config.cmake" "
find_package(boost_typeof)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_scope_exit-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_scope_exit-config.cmake" "
find_package(boost_preprocessor)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_scope_exit-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_scope_exit-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_scope_exit-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_scope_exit-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_scope_exit-config-version.cmake"
  DESTINATION lib/cmake/boost_scope_exit
)

