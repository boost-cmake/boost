
cmake_minimum_required(VERSION 3.5)
project(boost_function_types)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)

add_library(boost_function_types INTERFACE
)
add_library(boost::function_types ALIAS boost_function_types)
set_property(TARGET boost_function_types PROPERTY EXPORT_NAME function_types)

target_include_directories(boost_function_types INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_function_types INTERFACE boost::core)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_function_types INTERFACE boost::mpl)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_function_types INTERFACE boost::detail)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_function_types INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_function_types INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_function_types INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_function_types EXPORT boost_function_types-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_function_types-targets
  FILE boost_function_types-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_function_types
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_function_types-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function_types-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function_types-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function_types-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function_types-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function_types-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function_types-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_function_types-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_function_types-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_function_types-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_function_types-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_function_types-config-version.cmake"
  DESTINATION lib/cmake/boost_function_types
)

