
cmake_minimum_required(VERSION 3.5)
project(boost_foreach)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_config)

add_library(boost_foreach INTERFACE
)
add_library(boost::foreach ALIAS boost_foreach)
set_property(TARGET boost_foreach PROPERTY EXPORT_NAME foreach)

target_include_directories(boost_foreach INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_foreach INTERFACE boost::core)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_foreach INTERFACE boost::iterator)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_foreach INTERFACE boost::mpl)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_foreach INTERFACE boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_foreach INTERFACE boost::type_traits)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_foreach INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_foreach EXPORT boost_foreach-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_foreach-targets
  FILE boost_foreach-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_foreach
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_foreach-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_foreach-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_foreach-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_foreach-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_foreach-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_foreach-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_foreach-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_foreach-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_foreach-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_foreach-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_foreach-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_foreach-config-version.cmake"
  DESTINATION lib/cmake/boost_foreach
)

