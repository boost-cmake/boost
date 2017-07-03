
cmake_minimum_required(VERSION 3.5)
project(boost_heap)
include(CMakePackageConfigHelpers)

find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_throw_exception)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_array)
find_package(boost_config)
find_package(boost_parameter)
find_package(boost_intrusive)

add_library(boost_heap INTERFACE
)
add_library(boost::heap ALIAS boost_heap)
set_property(TARGET boost_heap PROPERTY EXPORT_NAME heap)

target_include_directories(boost_heap INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_static_assert_FOUND)
target_link_libraries(boost_heap INTERFACE boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_heap INTERFACE boost::iterator)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_heap INTERFACE boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_heap INTERFACE boost::mpl)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_heap INTERFACE boost::throw_exception)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_heap INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_heap INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_heap INTERFACE boost::concept_check)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_heap INTERFACE boost::array)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_heap INTERFACE boost::config)
endif()
if(boost_parameter_FOUND)
target_link_libraries(boost_heap INTERFACE boost::parameter)
endif()
if(boost_intrusive_FOUND)
target_link_libraries(boost_heap INTERFACE boost::intrusive)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_heap EXPORT boost_heap-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_heap-targets
  FILE boost_heap-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_heap
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_parameter_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_parameter)
")
endif()
if(boost_intrusive_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
find_package(boost_intrusive)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_heap-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_heap-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_heap-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_heap-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_heap-config-version.cmake"
  DESTINATION lib/cmake/boost_heap
)

