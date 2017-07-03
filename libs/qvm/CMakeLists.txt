
cmake_minimum_required(VERSION 3.5)
project(boost_qvm)
include(CMakePackageConfigHelpers)

find_package(boost_static_assert)
find_package(boost_core)
find_package(boost_exception)
find_package(boost_assert)
find_package(boost_throw_exception)

add_library(boost_qvm INTERFACE
)
add_library(boost::qvm ALIAS boost_qvm)
set_property(TARGET boost_qvm PROPERTY EXPORT_NAME qvm)

target_include_directories(boost_qvm INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_static_assert_FOUND)
target_link_libraries(boost_qvm INTERFACE boost::static_assert)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_qvm INTERFACE boost::core)
endif()
if(boost_exception_FOUND)
target_link_libraries(boost_qvm INTERFACE boost::exception)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_qvm INTERFACE boost::assert)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_qvm INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_qvm EXPORT boost_qvm-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_qvm-targets
  FILE boost_qvm-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_qvm
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_qvm-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_qvm-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_qvm-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_qvm-config.cmake" "
find_package(boost_exception)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_qvm-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_qvm-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_qvm-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_qvm-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_qvm-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_qvm-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_qvm-config-version.cmake"
  DESTINATION lib/cmake/boost_qvm
)

