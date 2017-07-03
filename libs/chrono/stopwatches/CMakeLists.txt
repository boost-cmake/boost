
cmake_minimum_required(VERSION 3.5)
project(boost_chrono_stopwatches)
include(CMakePackageConfigHelpers)

find_package(boost_chrono)
find_package(boost_format)
find_package(boost_system)
find_package(boost_assert)
find_package(boost_accumulators)
find_package(boost_config)

add_library(boost_chrono_stopwatches INTERFACE
)
add_library(boost::chrono_stopwatches ALIAS boost_chrono_stopwatches)
set_property(TARGET boost_chrono_stopwatches PROPERTY EXPORT_NAME chrono_stopwatches)

target_include_directories(boost_chrono_stopwatches INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_chrono_FOUND)
target_link_libraries(boost_chrono_stopwatches INTERFACE boost::chrono)
endif()
if(boost_format_FOUND)
target_link_libraries(boost_chrono_stopwatches INTERFACE boost::format)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_chrono_stopwatches INTERFACE boost::system)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_chrono_stopwatches INTERFACE boost::assert)
endif()
if(boost_accumulators_FOUND)
target_link_libraries(boost_chrono_stopwatches INTERFACE boost::accumulators)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_chrono_stopwatches INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_chrono_stopwatches EXPORT boost_chrono_stopwatches-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_chrono_stopwatches-targets
  FILE boost_chrono_stopwatches-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_chrono_stopwatches
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_chrono_stopwatches-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_chrono_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono_stopwatches-config.cmake" "
find_package(boost_chrono)
")
endif()
if(boost_format_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono_stopwatches-config.cmake" "
find_package(boost_format)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono_stopwatches-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono_stopwatches-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_accumulators_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono_stopwatches-config.cmake" "
find_package(boost_accumulators)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono_stopwatches-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_chrono_stopwatches-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_chrono_stopwatches-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_chrono_stopwatches-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_chrono_stopwatches-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_chrono_stopwatches-config-version.cmake"
  DESTINATION lib/cmake/boost_chrono_stopwatches
)

