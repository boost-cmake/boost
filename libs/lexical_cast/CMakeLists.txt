
cmake_minimum_required(VERSION 3.5)
project(boost_lexical_cast)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_container)
find_package(boost_mpl)
find_package(boost_array)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_numeric_conversion)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_math)

add_library(boost_lexical_cast INTERFACE
)
add_library(boost::lexical_cast ALIAS boost_lexical_cast)
set_property(TARGET boost_lexical_cast PROPERTY EXPORT_NAME lexical_cast)

target_include_directories(boost_lexical_cast INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::static_assert)
endif()
if(boost_container_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::container)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::mpl)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::array)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::assert)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::type_traits)
endif()
if(boost_numeric_conversion_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::numeric_conversion)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::integer)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::throw_exception)
endif()
if(boost_math_FOUND)
target_link_libraries(boost_lexical_cast INTERFACE boost::math)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_lexical_cast EXPORT boost_lexical_cast-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_lexical_cast-targets
  FILE boost_lexical_cast-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_lexical_cast
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_container_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_container)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_numeric_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_numeric_conversion)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_math_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
find_package(boost_math)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_lexical_cast-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_lexical_cast-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_lexical_cast-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_lexical_cast-config-version.cmake"
  DESTINATION lib/cmake/boost_lexical_cast
)

