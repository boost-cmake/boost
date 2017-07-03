
cmake_minimum_required(VERSION 3.5)
project(boost_chrono)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_ratio)
find_package(boost_predef)
find_package(boost_winapi)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_system)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_typeof)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

add_library(boost_chrono 
src/thread_clock.cpp
src/process_cpu_clocks.cpp
src/chrono.cpp
)
add_library(boost::chrono ALIAS boost_chrono)
set_property(TARGET boost_chrono PROPERTY EXPORT_NAME chrono)

target_include_directories(boost_chrono PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::static_assert)
endif()
if(boost_ratio_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::ratio)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::predef)
endif()
if(boost_winapi_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::winapi)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::mpl)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::move)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::system)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::type_traits)
endif()
if(boost_typeof_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::typeof)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::integer)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::throw_exception)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_chrono PUBLIC boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_chrono EXPORT boost_chrono-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_chrono-targets
  FILE boost_chrono-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_chrono
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_ratio_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_ratio)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_winapi_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_winapi)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_typeof_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_typeof)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_chrono-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_chrono-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_chrono-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_chrono-config-version.cmake"
  DESTINATION lib/cmake/boost_chrono
)

