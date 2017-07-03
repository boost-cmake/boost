
cmake_minimum_required(VERSION 3.5)
project(boost_local_function)
include(CMakePackageConfigHelpers)

find_package(boost_scope_exit)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_typeof)

add_library(boost_local_function INTERFACE
)
add_library(boost::local_function ALIAS boost_local_function)
set_property(TARGET boost_local_function PROPERTY EXPORT_NAME local_function)

target_include_directories(boost_local_function INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_scope_exit_FOUND)
target_link_libraries(boost_local_function INTERFACE boost::scope_exit)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_local_function INTERFACE boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_local_function INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_local_function INTERFACE boost::preprocessor)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_local_function INTERFACE boost::utility)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_local_function INTERFACE boost::config)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_local_function INTERFACE boost::typeof)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_local_function EXPORT boost_local_function-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_local_function-targets
  FILE boost_local_function-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_local_function
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_local_function-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_scope_exit_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_local_function-config.cmake" "
find_package(boost_scope_exit)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_local_function-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_local_function-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_local_function-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_local_function-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_local_function-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_local_function-config.cmake" "
find_package(boost_typeof)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_local_function-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_local_function-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_local_function-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_local_function-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_local_function-config-version.cmake"
  DESTINATION lib/cmake/boost_local_function
)

