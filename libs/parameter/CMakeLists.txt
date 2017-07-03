
cmake_minimum_required(VERSION 3.5)
project(boost_parameter)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_python)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_type_traits)
find_package(boost_optional)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_utility)

add_library(boost_parameter INTERFACE
)
add_library(boost::parameter ALIAS boost_parameter)
set_property(TARGET boost_parameter PROPERTY EXPORT_NAME parameter)

target_include_directories(boost_parameter INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_parameter INTERFACE boost::core)
endif()
if(boost_python_FOUND)
target_link_libraries(boost_parameter INTERFACE boost::python)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_parameter INTERFACE boost::mpl)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_parameter INTERFACE boost::detail)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_parameter INTERFACE boost::type_traits)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_parameter INTERFACE boost::optional)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_parameter INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_parameter INTERFACE boost::config)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_parameter INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_parameter EXPORT boost_parameter-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_parameter-targets
  FILE boost_parameter-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_parameter
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_python_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake" "
find_package(boost_python)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_parameter-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_parameter-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_parameter-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_parameter-config-version.cmake"
  DESTINATION lib/cmake/boost_parameter
)

