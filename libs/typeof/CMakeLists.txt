
cmake_minimum_required(VERSION 3.5)
project(boost_typeof)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_config)
find_package(boost_preprocessor)

add_library(boost_typeof INTERFACE
)
add_library(boost::typeof ALIAS boost_typeof)
set_property(TARGET boost_typeof PROPERTY EXPORT_NAME typeof)

target_include_directories(boost_typeof INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_typeof INTERFACE boost::core)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_typeof INTERFACE boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_typeof INTERFACE boost::type_traits)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_typeof INTERFACE boost::config)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_typeof INTERFACE boost::preprocessor)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_typeof EXPORT boost_typeof-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_typeof-targets
  FILE boost_typeof-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_typeof
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_typeof-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_typeof-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_typeof-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_typeof-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_typeof-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_typeof-config.cmake" "
find_package(boost_preprocessor)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_typeof-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_typeof-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_typeof-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_typeof-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_typeof-config-version.cmake"
  DESTINATION lib/cmake/boost_typeof
)

