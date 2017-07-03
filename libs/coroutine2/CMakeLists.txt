
cmake_minimum_required(VERSION 3.5)
project(boost_coroutine2)
include(CMakePackageConfigHelpers)

find_package(boost_assert)
find_package(boost_fiber)
find_package(boost_config)
find_package(boost_context)

add_library(boost_coroutine2 INTERFACE
)
add_library(boost::coroutine2 ALIAS boost_coroutine2)
set_property(TARGET boost_coroutine2 PROPERTY EXPORT_NAME coroutine2)

target_include_directories(boost_coroutine2 INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_assert_FOUND)
target_link_libraries(boost_coroutine2 INTERFACE boost::assert)
endif()
if(boost_fiber_FOUND)
target_link_libraries(boost_coroutine2 INTERFACE boost::fiber)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_coroutine2 INTERFACE boost::config)
endif()
if(boost_context_FOUND)
target_link_libraries(boost_coroutine2 INTERFACE boost::context)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_coroutine2 EXPORT boost_coroutine2-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_coroutine2-targets
  FILE boost_coroutine2-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_coroutine2
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_coroutine2-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine2-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_fiber_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine2-config.cmake" "
find_package(boost_fiber)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine2-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_context_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine2-config.cmake" "
find_package(boost_context)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine2-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_coroutine2-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_coroutine2-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_coroutine2-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_coroutine2-config-version.cmake"
  DESTINATION lib/cmake/boost_coroutine2
)

