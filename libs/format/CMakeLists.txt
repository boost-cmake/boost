
cmake_minimum_required(VERSION 3.5)
project(boost_format)
include(CMakePackageConfigHelpers)

find_package(boost_config)
find_package(boost_assert)
find_package(boost_smart_ptr)
find_package(boost_optional)
find_package(boost_throw_exception)
find_package(boost_utility)

add_library(boost_format INTERFACE
)
add_library(boost::format ALIAS boost_format)
set_property(TARGET boost_format PROPERTY EXPORT_NAME format)

target_include_directories(boost_format INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_config_FOUND)
target_link_libraries(boost_format INTERFACE boost::config)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_format INTERFACE boost::assert)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_format INTERFACE boost::smart_ptr)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_format INTERFACE boost::optional)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_format INTERFACE boost::throw_exception)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_format INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_format EXPORT boost_format-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_format-targets
  FILE boost_format-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_format
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_format-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_format-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_format-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_format-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_format-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_format-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_format-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_format-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_format-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_format-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_format-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_format-config-version.cmake"
  DESTINATION lib/cmake/boost_format
)

