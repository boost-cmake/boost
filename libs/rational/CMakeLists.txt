
cmake_minimum_required(VERSION 3.5)
project(boost_rational)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

add_library(boost_rational INTERFACE
)
add_library(boost::rational ALIAS boost_rational)
set_property(TARGET boost_rational PROPERTY EXPORT_NAME rational)

target_include_directories(boost_rational INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_rational INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_rational INTERFACE boost::static_assert)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_rational INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_rational INTERFACE boost::type_traits)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_rational INTERFACE boost::integer)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_rational INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_rational INTERFACE boost::throw_exception)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_rational INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_rational EXPORT boost_rational-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_rational-targets
  FILE boost_rational-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_rational
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_rational-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_rational-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_rational-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_rational-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_rational-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_rational-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_rational-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_rational-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_rational-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_rational-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_rational-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_rational-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_rational-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_rational-config-version.cmake"
  DESTINATION lib/cmake/boost_rational
)

