
cmake_minimum_required(VERSION 3.5)
project(boost_poly_collection)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_type_erasure)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_config)

add_library(boost_poly_collection INTERFACE
)
add_library(boost::poly_collection ALIAS boost_poly_collection)
set_property(TARGET boost_poly_collection PROPERTY EXPORT_NAME poly_collection)

target_include_directories(boost_poly_collection INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_poly_collection INTERFACE boost::core)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_poly_collection INTERFACE boost::iterator)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_poly_collection INTERFACE boost::mpl)
endif()
if(boost_type_erasure_FOUND)
target_link_libraries(boost_poly_collection INTERFACE boost::type_erasure)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_poly_collection INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_poly_collection INTERFACE boost::type_traits)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_poly_collection INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_poly_collection EXPORT boost_poly_collection-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_poly_collection-targets
  FILE boost_poly_collection-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_poly_collection
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_poly_collection-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_poly_collection-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_poly_collection-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_poly_collection-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_erasure_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_poly_collection-config.cmake" "
find_package(boost_type_erasure)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_poly_collection-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_poly_collection-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_poly_collection-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_poly_collection-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_poly_collection-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_poly_collection-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_poly_collection-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_poly_collection-config-version.cmake"
  DESTINATION lib/cmake/boost_poly_collection
)

