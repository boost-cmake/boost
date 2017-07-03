
cmake_minimum_required(VERSION 3.5)
project(boost_locale)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_static_assert)
find_package(boost_thread)
find_package(boost_iterator)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_unordered)

add_library(boost_locale INTERFACE
)
add_library(boost::locale ALIAS boost_locale)
set_property(TARGET boost_locale PROPERTY EXPORT_NAME locale)

target_include_directories(boost_locale INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_locale INTERFACE boost::function)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_locale INTERFACE boost::static_assert)
endif()
if(boost_thread_FOUND)
target_link_libraries(boost_locale INTERFACE boost::thread)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_locale INTERFACE boost::iterator)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_locale INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_locale INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_locale INTERFACE boost::smart_ptr)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_locale INTERFACE boost::config)
endif()
if(boost_unordered_FOUND)
target_link_libraries(boost_locale INTERFACE boost::unordered)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_locale EXPORT boost_locale-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_locale-targets
  FILE boost_locale-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_locale
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_locale-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_locale-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_locale-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_thread_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_locale-config.cmake" "
find_package(boost_thread)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_locale-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_locale-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_locale-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_locale-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_locale-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_unordered_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_locale-config.cmake" "
find_package(boost_unordered)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_locale-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_locale-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_locale-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_locale-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_locale-config-version.cmake"
  DESTINATION lib/cmake/boost_locale
)

