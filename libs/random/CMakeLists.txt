
cmake_minimum_required(VERSION 3.5)
project(boost_random)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_system)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_math)
find_package(boost_utility)

add_library(boost_random 
src/random_device.cpp
)
add_library(boost::random ALIAS boost_random)
set_property(TARGET boost_random PROPERTY EXPORT_NAME random)

target_include_directories(boost_random PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_random PUBLIC boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_random PUBLIC boost::static_assert)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_random PUBLIC boost::mpl)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_random PUBLIC boost::system)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_random PUBLIC boost::assert)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_random PUBLIC boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_random PUBLIC boost::type_traits)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_random PUBLIC boost::integer)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_random PUBLIC boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_random PUBLIC boost::throw_exception)
endif()
if(boost_math_FOUND)
target_link_libraries(boost_random PUBLIC boost::math)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_random PUBLIC boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_random EXPORT boost_random-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_random-targets
  FILE boost_random-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_random
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_math_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_math)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_random-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_random-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_random-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_random-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_random-config-version.cmake"
  DESTINATION lib/cmake/boost_random
)

