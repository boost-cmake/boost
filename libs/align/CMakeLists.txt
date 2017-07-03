
cmake_minimum_required(VERSION 3.5)
project(boost_align)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_assert)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_align INTERFACE
)
add_library(boost::align ALIAS boost_align)
set_property(TARGET boost_align PROPERTY EXPORT_NAME align)

target_include_directories(boost_align INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_align INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_align INTERFACE boost::static_assert)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_align INTERFACE boost::assert)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_align INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_align INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_align EXPORT boost_align-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_align-targets
  FILE boost_align-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_align
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_align-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_align-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_align-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_align-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_align-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_align-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_align-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_align-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_align-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_align-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_align-config-version.cmake"
  DESTINATION lib/cmake/boost_align
)

