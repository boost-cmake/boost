
cmake_minimum_required(VERSION 3.5)
project(boost_convert)
include(CMakePackageConfigHelpers)

find_package(boost_function_types)
find_package(boost_core)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_lexical_cast)
find_package(boost_parameter)
find_package(boost_config)
find_package(boost_spirit)
find_package(boost_math)

add_library(boost_convert INTERFACE
)
add_library(boost::convert ALIAS boost_convert)
set_property(TARGET boost_convert PROPERTY EXPORT_NAME convert)

target_include_directories(boost_convert INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_types_FOUND)
target_link_libraries(boost_convert INTERFACE boost::function_types)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_convert INTERFACE boost::core)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_convert INTERFACE boost::optional)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_convert INTERFACE boost::mpl)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_convert INTERFACE boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_convert INTERFACE boost::type_traits)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_convert INTERFACE boost::lexical_cast)
endif()
if(boost_parameter_FOUND)
target_link_libraries(boost_convert INTERFACE boost::parameter)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_convert INTERFACE boost::config)
endif()
if(boost_spirit_FOUND)
target_link_libraries(boost_convert INTERFACE boost::spirit)
endif()
if(boost_math_FOUND)
target_link_libraries(boost_convert INTERFACE boost::math)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_convert EXPORT boost_convert-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_convert-targets
  FILE boost_convert-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_convert
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_types_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
find_package(boost_function_types)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_parameter_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
find_package(boost_parameter)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_spirit_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
find_package(boost_spirit)
")
endif()
if(boost_math_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
find_package(boost_math)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_convert-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_convert-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_convert-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_convert-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_convert-config-version.cmake"
  DESTINATION lib/cmake/boost_convert
)

