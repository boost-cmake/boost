
cmake_minimum_required(VERSION 3.5)
project(boost_lambda)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_utility)

add_library(boost_lambda INTERFACE
)
add_library(boost::lambda ALIAS boost_lambda)
set_property(TARGET boost_lambda PROPERTY EXPORT_NAME lambda)

target_include_directories(boost_lambda INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_lambda INTERFACE boost::core)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_lambda INTERFACE boost::iterator)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_lambda INTERFACE boost::tuple)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_lambda INTERFACE boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_lambda INTERFACE boost::mpl)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_lambda INTERFACE boost::detail)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_lambda INTERFACE boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_lambda INTERFACE boost::preprocessor)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_lambda INTERFACE boost::config)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_lambda INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_lambda EXPORT boost_lambda-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_lambda-targets
  FILE boost_lambda-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_lambda
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_lambda-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_lambda-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_lambda-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_lambda-config-version.cmake"
  DESTINATION lib/cmake/boost_lambda
)

