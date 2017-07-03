
cmake_minimum_required(VERSION 3.5)
project(boost_function)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_type_traits)
find_package(boost_assert)
find_package(boost_type_index)
find_package(boost_preprocessor)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_typeof)

add_library(boost_function INTERFACE
)
add_library(boost::function ALIAS boost_function)
set_property(TARGET boost_function PROPERTY EXPORT_NAME function)

target_include_directories(boost_function INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_function INTERFACE boost::core)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_function INTERFACE boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_function INTERFACE boost::mpl)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_function INTERFACE boost::move)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_function INTERFACE boost::type_traits)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_function INTERFACE boost::assert)
endif()
if(boost_type_index_FOUND)
target_link_libraries(boost_function INTERFACE boost::type_index)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_function INTERFACE boost::preprocessor)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_function INTERFACE boost::integer)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_function INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_function INTERFACE boost::throw_exception)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_function INTERFACE boost::typeof)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_function EXPORT boost_function-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_function-targets
  FILE boost_function-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_function
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_index_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_type_index)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
find_package(boost_typeof)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_function-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_function-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_function-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_function-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_function-config-version.cmake"
  DESTINATION lib/cmake/boost_function
)

