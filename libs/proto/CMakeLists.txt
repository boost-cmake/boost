
cmake_minimum_required(VERSION 3.5)
project(boost_proto)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_range)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_typeof)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_preprocessor)

add_library(boost_proto INTERFACE
)
add_library(boost::proto ALIAS boost_proto)
set_property(TARGET boost_proto PROPERTY EXPORT_NAME proto)

target_include_directories(boost_proto INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_proto INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_proto INTERFACE boost::static_assert)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_proto INTERFACE boost::mpl)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_proto INTERFACE boost::range)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_proto INTERFACE boost::fusion)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_proto INTERFACE boost::type_traits)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_proto INTERFACE boost::typeof)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_proto INTERFACE boost::utility)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_proto INTERFACE boost::config)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_proto INTERFACE boost::preprocessor)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_proto EXPORT boost_proto-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_proto-targets
  FILE boost_proto-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_proto
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "
find_package(boost_typeof)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "
find_package(boost_preprocessor)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_proto-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_proto-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_proto-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_proto-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_proto-config-version.cmake"
  DESTINATION lib/cmake/boost_proto
)

