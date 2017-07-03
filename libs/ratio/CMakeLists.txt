
cmake_minimum_required(VERSION 3.5)
project(boost_ratio)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_rational)
find_package(boost_integer)
find_package(boost_config)

add_library(boost_ratio INTERFACE
)
add_library(boost::ratio ALIAS boost_ratio)
set_property(TARGET boost_ratio PROPERTY EXPORT_NAME ratio)

target_include_directories(boost_ratio INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_ratio INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_ratio INTERFACE boost::static_assert)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_ratio INTERFACE boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_ratio INTERFACE boost::type_traits)
endif()
if(boost_rational_FOUND)
target_link_libraries(boost_ratio INTERFACE boost::rational)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_ratio INTERFACE boost::integer)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_ratio INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_ratio EXPORT boost_ratio-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_ratio-targets
  FILE boost_ratio-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_ratio
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_ratio-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ratio-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ratio-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ratio-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ratio-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_rational_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ratio-config.cmake" "
find_package(boost_rational)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ratio-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_ratio-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_ratio-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_ratio-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_ratio-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_ratio-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_ratio-config-version.cmake"
  DESTINATION lib/cmake/boost_ratio
)

