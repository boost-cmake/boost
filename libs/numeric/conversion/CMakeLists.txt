
cmake_minimum_required(VERSION 3.5)
project(boost_numeric_conversion)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_conversion)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_numeric_conversion INTERFACE
)
add_library(boost::numeric_conversion ALIAS boost_numeric_conversion)
set_property(TARGET boost_numeric_conversion PROPERTY EXPORT_NAME numeric_conversion)

target_include_directories(boost_numeric_conversion INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_numeric_conversion INTERFACE boost::core)
endif()
if(boost_conversion_FOUND)
target_link_libraries(boost_numeric_conversion INTERFACE boost::conversion)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_numeric_conversion INTERFACE boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_numeric_conversion INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_numeric_conversion INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_numeric_conversion INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_numeric_conversion INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_numeric_conversion EXPORT boost_numeric_conversion-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_numeric_conversion-targets
  FILE boost_numeric_conversion-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_numeric_conversion
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_numeric_conversion-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_conversion-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_conversion-config.cmake" "
find_package(boost_conversion)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_conversion-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_conversion-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_conversion-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_conversion-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_conversion-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_conversion-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_numeric_conversion-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_numeric_conversion-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_numeric_conversion-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_numeric_conversion-config-version.cmake"
  DESTINATION lib/cmake/boost_numeric_conversion
)

