
cmake_minimum_required(VERSION 3.5)
project(boost_utility)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_utility INTERFACE
)
add_library(boost::utility ALIAS boost_utility)
set_property(TARGET boost_utility PROPERTY EXPORT_NAME utility)

target_include_directories(boost_utility INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_utility INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_utility INTERFACE boost::static_assert)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_utility INTERFACE boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_utility INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_utility INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_utility INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_utility INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_utility EXPORT boost_utility-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_utility-targets
  FILE boost_utility-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_utility
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_utility-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_utility-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_utility-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_utility-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_utility-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_utility-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_utility-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_utility-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_utility-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_utility-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_utility-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_utility-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_utility-config-version.cmake"
  DESTINATION lib/cmake/boost_utility
)

