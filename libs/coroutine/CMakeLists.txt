
cmake_minimum_required(VERSION 3.5)
project(boost_coroutine)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_exception)
find_package(boost_thread)
find_package(boost_move)
find_package(boost_system)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_context)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

add_library(boost_coroutine 
src/exceptions.cpp
)
add_library(boost::coroutine ALIAS boost_coroutine)
set_property(TARGET boost_coroutine PROPERTY EXPORT_NAME coroutine)

target_include_directories(boost_coroutine PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::core)
endif()
if(boost_exception_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::exception)
endif()
if(boost_thread_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::thread)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::move)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::system)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::assert)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::type_traits)
endif()
if(boost_context_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::context)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::throw_exception)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_coroutine PUBLIC boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_coroutine EXPORT boost_coroutine-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_coroutine-targets
  FILE boost_coroutine-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_coroutine
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_exception)
")
endif()
if(boost_thread_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_thread)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_context_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_context)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_coroutine-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_coroutine-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_coroutine-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_coroutine-config-version.cmake"
  DESTINATION lib/cmake/boost_coroutine
)

