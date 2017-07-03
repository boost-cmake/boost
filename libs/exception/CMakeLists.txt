
cmake_minimum_required(VERSION 3.5)
project(boost_exception)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_tuple)
find_package(boost_assert)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_exception 
src/clone_current_exception_non_intrusive.cpp
)
add_library(boost::exception ALIAS boost_exception)
set_property(TARGET boost_exception PROPERTY EXPORT_NAME exception)

target_include_directories(boost_exception PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_exception PUBLIC boost::core)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_exception PUBLIC boost::tuple)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_exception PUBLIC boost::assert)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_exception PUBLIC boost::smart_ptr)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_exception PUBLIC boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_exception PUBLIC boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_exception EXPORT boost_exception-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_exception-targets
  FILE boost_exception-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_exception
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_exception-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_exception-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_exception-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_exception-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_exception-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_exception-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_exception-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_exception-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_exception-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_exception-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_exception-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_exception-config-version.cmake"
  DESTINATION lib/cmake/boost_exception
)

