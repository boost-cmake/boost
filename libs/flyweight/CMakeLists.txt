
cmake_minimum_required(VERSION 3.5)
project(boost_flyweight)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_config)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_interprocess)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_serialization)
find_package(boost_multi_index)
find_package(boost_parameter)
find_package(boost_throw_exception)
find_package(boost_preprocessor)

add_library(boost_flyweight INTERFACE
)
add_library(boost::flyweight ALIAS boost_flyweight)
set_property(TARGET boost_flyweight PROPERTY EXPORT_NAME flyweight)

target_include_directories(boost_flyweight INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::core)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::config)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::mpl)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::detail)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::functional)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::assert)
endif()
if(boost_interprocess_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::interprocess)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::smart_ptr)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::serialization)
endif()
if(boost_multi_index_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::multi_index)
endif()
if(boost_parameter_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::parameter)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::throw_exception)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_flyweight INTERFACE boost::preprocessor)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_flyweight EXPORT boost_flyweight-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_flyweight-targets
  FILE boost_flyweight-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_flyweight
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_interprocess_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_interprocess)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_multi_index_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_multi_index)
")
endif()
if(boost_parameter_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_parameter)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
find_package(boost_preprocessor)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_flyweight-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_flyweight-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_flyweight-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_flyweight-config-version.cmake"
  DESTINATION lib/cmake/boost_flyweight
)

