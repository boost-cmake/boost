
cmake_minimum_required(VERSION 3.5)
project(boost_phoenix)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_predef)
find_package(boost_proto)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_smart_ptr)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_fusion)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_utility)

add_library(boost_phoenix INTERFACE
)
add_library(boost::phoenix ALIAS boost_phoenix)
set_property(TARGET boost_phoenix PROPERTY EXPORT_NAME phoenix)

target_include_directories(boost_phoenix INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::core)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::predef)
endif()
if(boost_proto_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::proto)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::mpl)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::detail)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::assert)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::smart_ptr)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::type_traits)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::fusion)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::config)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_phoenix INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_phoenix EXPORT boost_phoenix-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_phoenix-targets
  FILE boost_phoenix-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_phoenix
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_proto_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_proto)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_phoenix-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_phoenix-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_phoenix-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_phoenix-config-version.cmake"
  DESTINATION lib/cmake/boost_phoenix
)

