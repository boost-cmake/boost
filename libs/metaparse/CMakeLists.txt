
cmake_minimum_required(VERSION 3.5)
project(boost_metaparse)
include(CMakePackageConfigHelpers)

find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)

add_library(boost_metaparse INTERFACE
)
add_library(boost::metaparse ALIAS boost_metaparse)
set_property(TARGET boost_metaparse PROPERTY EXPORT_NAME metaparse)

target_include_directories(boost_metaparse INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_static_assert_FOUND)
target_link_libraries(boost_metaparse INTERFACE boost::static_assert)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_metaparse INTERFACE boost::predef)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_metaparse INTERFACE boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_metaparse INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_metaparse INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_metaparse INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_metaparse EXPORT boost_metaparse-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_metaparse-targets
  FILE boost_metaparse-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_metaparse
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_metaparse-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_metaparse-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_metaparse-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_metaparse-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_metaparse-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_metaparse-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_metaparse-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_metaparse-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_metaparse-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_metaparse-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_metaparse-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_metaparse-config-version.cmake"
  DESTINATION lib/cmake/boost_metaparse
)

