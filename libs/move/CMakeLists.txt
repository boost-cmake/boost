
cmake_minimum_required(VERSION 3.5)
project(boost_move)
include(CMakePackageConfigHelpers)

find_package(boost_assert)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_config)

add_library(boost_move INTERFACE
)
add_library(boost::move ALIAS boost_move)
set_property(TARGET boost_move PROPERTY EXPORT_NAME move)

target_include_directories(boost_move INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_assert_FOUND)
target_link_libraries(boost_move INTERFACE boost::assert)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_move INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_move INTERFACE boost::static_assert)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_move INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_move EXPORT boost_move-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_move-targets
  FILE boost_move-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_move
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_move-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_move-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_move-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_move-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_move-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_move-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_move-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_move-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_move-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_move-config-version.cmake"
  DESTINATION lib/cmake/boost_move
)

