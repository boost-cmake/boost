
cmake_minimum_required(VERSION 3.5)
project(boost_conversion)
include(CMakePackageConfigHelpers)

find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_typeof)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_smart_ptr)

add_library(boost_conversion INTERFACE
)
add_library(boost::conversion ALIAS boost_conversion)
set_property(TARGET boost_conversion PROPERTY EXPORT_NAME conversion)

target_include_directories(boost_conversion INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_assert_FOUND)
target_link_libraries(boost_conversion INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_conversion INTERFACE boost::type_traits)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_conversion INTERFACE boost::typeof)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_conversion INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_conversion INTERFACE boost::throw_exception)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_conversion INTERFACE boost::smart_ptr)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_conversion EXPORT boost_conversion-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_conversion-targets
  FILE boost_conversion-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_conversion
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_conversion-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_conversion-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_conversion-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_conversion-config.cmake" "
find_package(boost_typeof)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_conversion-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_conversion-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_conversion-config.cmake" "
find_package(boost_smart_ptr)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_conversion-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_conversion-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_conversion-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_conversion-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_conversion-config-version.cmake"
  DESTINATION lib/cmake/boost_conversion
)

