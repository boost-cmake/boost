
cmake_minimum_required(VERSION 3.5)
project(boost_detail)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)

add_library(boost_detail INTERFACE
)
add_library(boost::detail ALIAS boost_detail)
set_property(TARGET boost_detail PROPERTY EXPORT_NAME detail)

target_include_directories(boost_detail INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_detail INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_detail INTERFACE boost::static_assert)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_detail INTERFACE boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_detail INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_detail INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_detail INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_detail EXPORT boost_detail-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_detail-targets
  FILE boost_detail-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_detail
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_detail-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_detail-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_detail-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_detail-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_detail-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_detail-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_detail-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_detail-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_detail-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_detail-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_detail-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_detail-config-version.cmake"
  DESTINATION lib/cmake/boost_detail
)

