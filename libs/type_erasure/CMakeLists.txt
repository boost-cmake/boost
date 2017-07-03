
cmake_minimum_required(VERSION 3.5)
project(boost_type_erasure)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_thread)
find_package(boost_iterator)
find_package(boost_typeof)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_smart_ptr)

add_library(boost_type_erasure 
src/dynamic_binding.cpp
)
add_library(boost::type_erasure ALIAS boost_type_erasure)
set_property(TARGET boost_type_erasure PROPERTY EXPORT_NAME type_erasure)

target_include_directories(boost_type_erasure PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::core)
endif()
if(boost_thread_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::thread)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::iterator)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::typeof)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::mpl)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::assert)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::fusion)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::throw_exception)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_type_erasure PUBLIC boost::smart_ptr)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_type_erasure EXPORT boost_type_erasure-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_type_erasure-targets
  FILE boost_type_erasure-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_type_erasure
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_thread_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_thread)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_typeof)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
find_package(boost_smart_ptr)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_type_erasure-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_type_erasure-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_type_erasure-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_type_erasure-config-version.cmake"
  DESTINATION lib/cmake/boost_type_erasure
)

