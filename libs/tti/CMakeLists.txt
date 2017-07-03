
cmake_minimum_required(VERSION 3.5)
project(boost_tti)
include(CMakePackageConfigHelpers)

find_package(boost_function_types)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)

add_library(boost_tti INTERFACE
)
add_library(boost::tti ALIAS boost_tti)
set_property(TARGET boost_tti PROPERTY EXPORT_NAME tti)

target_include_directories(boost_tti INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_types_FOUND)
target_link_libraries(boost_tti INTERFACE boost::function_types)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_tti INTERFACE boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_tti INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_tti INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_tti INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_tti EXPORT boost_tti-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_tti-targets
  FILE boost_tti-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_tti
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_tti-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_types_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tti-config.cmake" "
find_package(boost_function_types)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tti-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tti-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tti-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tti-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_tti-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_tti-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_tti-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_tti-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_tti-config-version.cmake"
  DESTINATION lib/cmake/boost_tti
)

