
cmake_minimum_required(VERSION 3.5)
project(boost_intrusive)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_move)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_config)

add_library(boost_intrusive INTERFACE
)
add_library(boost::intrusive ALIAS boost_intrusive)
set_property(TARGET boost_intrusive PROPERTY EXPORT_NAME intrusive)

target_include_directories(boost_intrusive INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_intrusive INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_intrusive INTERFACE boost::static_assert)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_intrusive INTERFACE boost::move)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_intrusive INTERFACE boost::functional)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_intrusive INTERFACE boost::assert)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_intrusive INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_intrusive EXPORT boost_intrusive-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_intrusive-targets
  FILE boost_intrusive-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_intrusive
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_intrusive-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_intrusive-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_intrusive-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_intrusive-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_intrusive-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_intrusive-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_intrusive-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_intrusive-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_intrusive-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_intrusive-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_intrusive-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_intrusive-config-version.cmake"
  DESTINATION lib/cmake/boost_intrusive
)

