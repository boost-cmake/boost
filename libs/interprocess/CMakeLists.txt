
cmake_minimum_required(VERSION 3.5)
project(boost_interprocess)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_container)
find_package(boost_date_time)
find_package(boost_winapi)
find_package(boost_move)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_integer)
find_package(boost_intrusive)
find_package(boost_config)
find_package(boost_unordered)

add_library(boost_interprocess INTERFACE
)
add_library(boost::interprocess ALIAS boost_interprocess)
set_property(TARGET boost_interprocess PROPERTY EXPORT_NAME interprocess)

target_include_directories(boost_interprocess INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::static_assert)
endif()
if(boost_container_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::container)
endif()
if(boost_date_time_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::date_time)
endif()
if(boost_winapi_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::winapi)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::move)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::type_traits)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::integer)
endif()
if(boost_intrusive_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::intrusive)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::config)
endif()
if(boost_unordered_FOUND)
target_link_libraries(boost_interprocess INTERFACE boost::unordered)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_interprocess EXPORT boost_interprocess-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_interprocess-targets
  FILE boost_interprocess-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_interprocess
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_container_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_container)
")
endif()
if(boost_date_time_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_date_time)
")
endif()
if(boost_winapi_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_winapi)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_intrusive_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_intrusive)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_unordered_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
find_package(boost_unordered)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_interprocess-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_interprocess-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_interprocess-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_interprocess-config-version.cmake"
  DESTINATION lib/cmake/boost_interprocess
)

