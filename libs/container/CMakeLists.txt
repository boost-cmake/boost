
cmake_minimum_required(VERSION 3.5)
project(boost_container)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_move)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_intrusive)
find_package(boost_config)

add_library(boost_container 
src/monotonic_buffer_resource.cpp
src/pool_resource.cpp
src/synchronized_pool_resource.cpp
src/unsynchronized_pool_resource.cpp
src/dlmalloc.cpp
src/global_resource.cpp
)
add_library(boost::container ALIAS boost_container)
set_property(TARGET boost_container PROPERTY EXPORT_NAME container)

target_include_directories(boost_container PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_container PUBLIC boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_container PUBLIC boost::static_assert)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_container PUBLIC boost::move)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_container PUBLIC boost::functional)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_container PUBLIC boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_container PUBLIC boost::type_traits)
endif()
if(boost_intrusive_FOUND)
target_link_libraries(boost_container PUBLIC boost::intrusive)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_container PUBLIC boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_container EXPORT boost_container-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_container-targets
  FILE boost_container-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_container
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_container-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_container-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_container-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_container-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_container-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_container-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_container-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_intrusive_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_container-config.cmake" "
find_package(boost_intrusive)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_container-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_container-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_container-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_container-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_container-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_container-config-version.cmake"
  DESTINATION lib/cmake/boost_container
)

