
cmake_minimum_required(VERSION 3.5)
project(boost_filesystem)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_detail)
find_package(boost_system)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_io)
find_package(boost_config)

add_library(boost_filesystem 
src/operations.cpp
src/portability.cpp
src/codecvt_error_category.cpp
src/utf8_codecvt_facet.cpp
src/windows_file_codecvt.cpp
src/unique_path.cpp
src/path.cpp
src/path_traits.cpp
)
add_library(boost::filesystem ALIAS boost_filesystem)
set_property(TARGET boost_filesystem PROPERTY EXPORT_NAME filesystem)

target_include_directories(boost_filesystem PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::iterator)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::detail)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::system)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::functional)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::assert)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::smart_ptr)
endif()
if(boost_io_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::io)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_filesystem PUBLIC boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_filesystem EXPORT boost_filesystem-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_filesystem-targets
  FILE boost_filesystem-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_filesystem
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_io_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_io)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_filesystem-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_filesystem-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_filesystem-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_filesystem-config-version.cmake"
  DESTINATION lib/cmake/boost_filesystem
)

