
cmake_minimum_required(VERSION 3.5)
project(boost_phoenix_test)
include(CMakePackageConfigHelpers)

find_package(boost_spirit)
find_package(boost_phoenix)

add_library(boost_phoenix_test INTERFACE
)
add_library(boost::phoenix_test ALIAS boost_phoenix_test)
set_property(TARGET boost_phoenix_test PROPERTY EXPORT_NAME phoenix_test)

target_include_directories(boost_phoenix_test INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_spirit_FOUND)
target_link_libraries(boost_phoenix_test INTERFACE boost::spirit)
endif()
if(boost_phoenix_FOUND)
target_link_libraries(boost_phoenix_test INTERFACE boost::phoenix)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_phoenix_test EXPORT boost_phoenix_test-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_phoenix_test-targets
  FILE boost_phoenix_test-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_phoenix_test
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_phoenix_test-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_spirit_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix_test-config.cmake" "
find_package(boost_spirit)
")
endif()
if(boost_phoenix_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix_test-config.cmake" "
find_package(boost_phoenix)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_phoenix_test-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_phoenix_test-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_phoenix_test-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_phoenix_test-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_phoenix_test-config-version.cmake"
  DESTINATION lib/cmake/boost_phoenix_test
)

