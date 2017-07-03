
cmake_minimum_required(VERSION 3.5)
project(boost_msm)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_phoenix)
find_package(boost_proto)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_tuple)
find_package(boost_fusion)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_circular_buffer)
find_package(boost_serialization)
find_package(boost_config)
find_package(boost_parameter)
find_package(boost_any)
find_package(boost_typeof)

add_library(boost_msm INTERFACE
)
add_library(boost::msm ALIAS boost_msm)
set_property(TARGET boost_msm PROPERTY EXPORT_NAME msm)

target_include_directories(boost_msm INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_msm INTERFACE boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_msm INTERFACE boost::core)
endif()
if(boost_phoenix_FOUND)
target_link_libraries(boost_msm INTERFACE boost::phoenix)
endif()
if(boost_proto_FOUND)
target_link_libraries(boost_msm INTERFACE boost::proto)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_msm INTERFACE boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_msm INTERFACE boost::mpl)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_msm INTERFACE boost::tuple)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_msm INTERFACE boost::fusion)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_msm INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_msm INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_msm INTERFACE boost::preprocessor)
endif()
if(boost_circular_buffer_FOUND)
target_link_libraries(boost_msm INTERFACE boost::circular_buffer)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_msm INTERFACE boost::serialization)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_msm INTERFACE boost::config)
endif()
if(boost_parameter_FOUND)
target_link_libraries(boost_msm INTERFACE boost::parameter)
endif()
if(boost_any_FOUND)
target_link_libraries(boost_msm INTERFACE boost::any)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_msm INTERFACE boost::typeof)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_msm EXPORT boost_msm-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_msm-targets
  FILE boost_msm-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_msm
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_phoenix_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_phoenix)
")
endif()
if(boost_proto_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_proto)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_circular_buffer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_circular_buffer)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_parameter_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_parameter)
")
endif()
if(boost_any_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_any)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
find_package(boost_typeof)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_msm-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_msm-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_msm-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_msm-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_msm-config-version.cmake"
  DESTINATION lib/cmake/boost_msm
)

