
cmake_minimum_required(VERSION 3.5)
project(boost_endian)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_system)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_config)
find_package(boost_utility)

add_library(boost_endian INTERFACE
)
add_library(boost::endian ALIAS boost_endian)
set_property(TARGET boost_endian PROPERTY EXPORT_NAME endian)

target_include_directories(boost_endian INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_endian INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_endian INTERFACE boost::static_assert)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_endian INTERFACE boost::predef)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_endian INTERFACE boost::system)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_endian INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_endian INTERFACE boost::type_traits)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_endian INTERFACE boost::config)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_endian INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_endian EXPORT boost_endian-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_endian-targets
  FILE boost_endian-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_endian
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_endian-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_endian-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_endian-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_endian-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_endian-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_endian-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_endian-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_endian-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_endian-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_endian-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_endian-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_endian-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_endian-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_endian-config-version.cmake"
  DESTINATION lib/cmake/boost_endian
)

