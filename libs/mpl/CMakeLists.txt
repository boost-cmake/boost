
cmake_minimum_required(VERSION 3.5)
project(boost_mpl)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_utility)

add_library(boost_mpl INTERFACE
)
add_library(boost::mpl ALIAS boost_mpl)
set_property(TARGET boost_mpl PROPERTY EXPORT_NAME mpl)

target_include_directories(boost_mpl INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_mpl INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_mpl INTERFACE boost::static_assert)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_mpl INTERFACE boost::predef)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_mpl INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_mpl INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_mpl INTERFACE boost::config)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_mpl INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_mpl EXPORT boost_mpl-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_mpl-targets
  FILE boost_mpl-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_mpl
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_mpl-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpl-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpl-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpl-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpl-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpl-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpl-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_mpl-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_mpl-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_mpl-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_mpl-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_mpl-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_mpl-config-version.cmake"
  DESTINATION lib/cmake/boost_mpl
)

