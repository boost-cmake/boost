
cmake_minimum_required(VERSION 3.5)
project(boost_system)
include(CMakePackageConfigHelpers)

find_package(boost_assert)
find_package(boost_core)
find_package(boost_config)
find_package(boost_predef)

add_library(boost_system 
src/error_code.cpp
)
add_library(boost::system ALIAS boost_system)
set_property(TARGET boost_system PROPERTY EXPORT_NAME system)

target_include_directories(boost_system PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_assert_FOUND)
target_link_libraries(boost_system PUBLIC boost::assert)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_system PUBLIC boost::core)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_system PUBLIC boost::config)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_system PUBLIC boost::predef)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_system EXPORT boost_system-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_system-targets
  FILE boost_system-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_system
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_system-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_system-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_system-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_system-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_system-config.cmake" "
find_package(boost_predef)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_system-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_system-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_system-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_system-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_system-config-version.cmake"
  DESTINATION lib/cmake/boost_system
)

