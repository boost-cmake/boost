
cmake_minimum_required(VERSION 3.5)
project(boost_asio)
include(CMakePackageConfigHelpers)

find_package(boost_date_time)
find_package(boost_coroutine)
find_package(boost_function)
find_package(boost_bind)
find_package(boost_array)
find_package(boost_chrono)
find_package(boost_system)
find_package(boost_regex)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_core)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_asio INTERFACE
)
add_library(boost::asio ALIAS boost_asio)
set_property(TARGET boost_asio PROPERTY EXPORT_NAME asio)

target_include_directories(boost_asio INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_date_time_FOUND)
target_link_libraries(boost_asio INTERFACE boost::date_time)
endif()
if(boost_coroutine_FOUND)
target_link_libraries(boost_asio INTERFACE boost::coroutine)
endif()
if(boost_function_FOUND)
target_link_libraries(boost_asio INTERFACE boost::function)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_asio INTERFACE boost::bind)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_asio INTERFACE boost::array)
endif()
if(boost_chrono_FOUND)
target_link_libraries(boost_asio INTERFACE boost::chrono)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_asio INTERFACE boost::system)
endif()
if(boost_regex_FOUND)
target_link_libraries(boost_asio INTERFACE boost::regex)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_asio INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_asio INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_asio INTERFACE boost::smart_ptr)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_asio INTERFACE boost::core)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_asio INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_asio INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_asio EXPORT boost_asio-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_asio-targets
  FILE boost_asio-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_asio
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_date_time_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_date_time)
")
endif()
if(boost_coroutine_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_coroutine)
")
endif()
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_chrono_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_chrono)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_regex_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_regex)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_asio-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_asio-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_asio-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_asio-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_asio-config-version.cmake"
  DESTINATION lib/cmake/boost_asio
)

