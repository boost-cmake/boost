
cmake_minimum_required(VERSION 3.5)
project(boost_pool)
include(CMakePackageConfigHelpers)

find_package(boost_thread)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_pool INTERFACE
)
add_library(boost::pool ALIAS boost_pool)
set_property(TARGET boost_pool PROPERTY EXPORT_NAME pool)

target_include_directories(boost_pool INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_thread_FOUND)
target_link_libraries(boost_pool INTERFACE boost::thread)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_pool INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_pool INTERFACE boost::type_traits)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_pool INTERFACE boost::integer)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_pool INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_pool INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_pool EXPORT boost_pool-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_pool-targets
  FILE boost_pool-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_pool
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_pool-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_thread_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_pool-config.cmake" "
find_package(boost_thread)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_pool-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_pool-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_pool-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_pool-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_pool-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_pool-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_pool-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_pool-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_pool-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_pool-config-version.cmake"
  DESTINATION lib/cmake/boost_pool
)

