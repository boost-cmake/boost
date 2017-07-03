
cmake_minimum_required(VERSION 3.5)
project(boost_hana)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_tuple)
find_package(boost_fusion)
find_package(boost_config)
find_package(boost_mpl)

add_library(boost_hana INTERFACE
)
add_library(boost::hana ALIAS boost_hana)
set_property(TARGET boost_hana PROPERTY EXPORT_NAME hana)

target_include_directories(boost_hana INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_hana INTERFACE boost::core)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_hana INTERFACE boost::tuple)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_hana INTERFACE boost::fusion)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_hana INTERFACE boost::config)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_hana INTERFACE boost::mpl)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_hana EXPORT boost_hana-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_hana-targets
  FILE boost_hana-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_hana
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_hana-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_hana-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_hana-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_hana-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_hana-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_hana-config.cmake" "
find_package(boost_mpl)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_hana-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_hana-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_hana-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_hana-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_hana-config-version.cmake"
  DESTINATION lib/cmake/boost_hana
)

