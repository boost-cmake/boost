
cmake_minimum_required(VERSION 3.5)
project(boost_concept_check)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)

add_library(boost_concept_check INTERFACE
)
add_library(boost::concept_check ALIAS boost_concept_check)
set_property(TARGET boost_concept_check PROPERTY EXPORT_NAME concept_check)

target_include_directories(boost_concept_check INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_concept_check INTERFACE boost::core)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_concept_check INTERFACE boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_concept_check INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_concept_check INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_concept_check INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_concept_check EXPORT boost_concept_check-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_concept_check-targets
  FILE boost_concept_check-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_concept_check
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_concept_check-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_concept_check-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_concept_check-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_concept_check-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_concept_check-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_concept_check-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_concept_check-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_concept_check-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_concept_check-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_concept_check-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_concept_check-config-version.cmake"
  DESTINATION lib/cmake/boost_concept_check
)

