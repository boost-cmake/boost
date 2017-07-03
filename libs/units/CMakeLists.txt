
cmake_minimum_required(VERSION 3.5)
project(boost_units)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_typeof)
find_package(boost_io)
find_package(boost_integer)
find_package(boost_serialization)
find_package(boost_config)
find_package(boost_math)
find_package(boost_lambda)

add_library(boost_units INTERFACE
)
add_library(boost::units ALIAS boost_units)
set_property(TARGET boost_units PROPERTY EXPORT_NAME units)

target_include_directories(boost_units INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_units INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_units INTERFACE boost::static_assert)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_units INTERFACE boost::mpl)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_units INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_units INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_units INTERFACE boost::preprocessor)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_units INTERFACE boost::typeof)
endif()
if(boost_io_FOUND)
target_link_libraries(boost_units INTERFACE boost::io)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_units INTERFACE boost::integer)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_units INTERFACE boost::serialization)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_units INTERFACE boost::config)
endif()
if(boost_math_FOUND)
target_link_libraries(boost_units INTERFACE boost::math)
endif()
if(boost_lambda_FOUND)
target_link_libraries(boost_units INTERFACE boost::lambda)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_units EXPORT boost_units-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_units-targets
  FILE boost_units-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_units
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_typeof)
")
endif()
if(boost_io_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_io)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_math_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_math)
")
endif()
if(boost_lambda_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
find_package(boost_lambda)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_units-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_units-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_units-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_units-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_units-config-version.cmake"
  DESTINATION lib/cmake/boost_units
)

