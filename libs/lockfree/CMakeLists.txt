
cmake_minimum_required(VERSION 3.5)
project(boost_lockfree)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_tuple)
find_package(boost_config)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_atomic)
find_package(boost_integer)
find_package(boost_array)
find_package(boost_parameter)
find_package(boost_align)
find_package(boost_utility)

add_library(boost_lockfree INTERFACE
)
add_library(boost::lockfree ALIAS boost_lockfree)
set_property(TARGET boost_lockfree PROPERTY EXPORT_NAME lockfree)

target_include_directories(boost_lockfree INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::static_assert)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::predef)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::tuple)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::config)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::mpl)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::type_traits)
endif()
if(boost_atomic_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::atomic)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::integer)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::array)
endif()
if(boost_parameter_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::parameter)
endif()
if(boost_align_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::align)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_lockfree INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_lockfree EXPORT boost_lockfree-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_lockfree-targets
  FILE boost_lockfree-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_lockfree
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_atomic_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_atomic)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_parameter_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_parameter)
")
endif()
if(boost_align_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_align)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_lockfree-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_lockfree-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_lockfree-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_lockfree-config-version.cmake"
  DESTINATION lib/cmake/boost_lockfree
)

