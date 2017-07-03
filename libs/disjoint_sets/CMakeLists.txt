
cmake_minimum_required(VERSION 3.5)
project(boost_disjoint_sets)
include(CMakePackageConfigHelpers)

find_package(boost_graph)

add_library(boost_disjoint_sets INTERFACE
)
add_library(boost::disjoint_sets ALIAS boost_disjoint_sets)
set_property(TARGET boost_disjoint_sets PROPERTY EXPORT_NAME disjoint_sets)

target_include_directories(boost_disjoint_sets INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_graph_FOUND)
target_link_libraries(boost_disjoint_sets INTERFACE boost::graph)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_disjoint_sets EXPORT boost_disjoint_sets-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_disjoint_sets-targets
  FILE boost_disjoint_sets-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_disjoint_sets
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_disjoint_sets-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_graph_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_disjoint_sets-config.cmake" "
find_package(boost_graph)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_disjoint_sets-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_disjoint_sets-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_disjoint_sets-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_disjoint_sets-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_disjoint_sets-config-version.cmake"
  DESTINATION lib/cmake/boost_disjoint_sets
)

