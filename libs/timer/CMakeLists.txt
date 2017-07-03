
cmake_minimum_required(VERSION 3.5)
project(boost_timer)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_chrono)
find_package(boost_system)
find_package(boost_io)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_timer 
src/auto_timers_construction.cpp
src/cpu_timer.cpp
)
add_library(boost::timer ALIAS boost_timer)
set_property(TARGET boost_timer PROPERTY EXPORT_NAME timer)

target_include_directories(boost_timer PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_timer PUBLIC boost::core)
endif()
if(boost_chrono_FOUND)
target_link_libraries(boost_timer PUBLIC boost::chrono)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_timer PUBLIC boost::system)
endif()
if(boost_io_FOUND)
target_link_libraries(boost_timer PUBLIC boost::io)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_timer PUBLIC boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_timer PUBLIC boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_timer EXPORT boost_timer-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_timer-targets
  FILE boost_timer-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_timer
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_timer-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_timer-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_chrono_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_timer-config.cmake" "
find_package(boost_chrono)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_timer-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_io_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_timer-config.cmake" "
find_package(boost_io)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_timer-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_timer-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_timer-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_timer-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_timer-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_timer-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_timer-config-version.cmake"
  DESTINATION lib/cmake/boost_timer
)

