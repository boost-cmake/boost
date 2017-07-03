
cmake_minimum_required(VERSION 3.5)
project(boost_gil)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_preprocessor)

add_library(boost_gil INTERFACE
)
add_library(boost::gil ALIAS boost_gil)
set_property(TARGET boost_gil PROPERTY EXPORT_NAME gil)

target_include_directories(boost_gil INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_gil INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_gil INTERFACE boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_gil INTERFACE boost::iterator)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_gil INTERFACE boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_gil INTERFACE boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_gil INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_gil INTERFACE boost::concept_check)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_gil INTERFACE boost::smart_ptr)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_gil INTERFACE boost::config)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_gil INTERFACE boost::preprocessor)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_gil EXPORT boost_gil-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_gil-targets
  FILE boost_gil-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_gil
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "
find_package(boost_preprocessor)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_gil-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_gil-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_gil-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_gil-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_gil-config-version.cmake"
  DESTINATION lib/cmake/boost_gil
)

