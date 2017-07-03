
cmake_minimum_required(VERSION 3.5)
project(boost_process)
include(CMakePackageConfigHelpers)

find_package(boost_asio)
find_package(boost_core)
find_package(boost_tokenizer)
find_package(boost_algorithm)
find_package(boost_iterator)
find_package(boost_config)
find_package(boost_move)
find_package(boost_system)
find_package(boost_winapi)
find_package(boost_fusion)
find_package(boost_type_index)
find_package(boost_filesystem)
find_package(boost_optional)

add_library(boost_process INTERFACE
)
add_library(boost::process ALIAS boost_process)
set_property(TARGET boost_process PROPERTY EXPORT_NAME process)

target_include_directories(boost_process INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_asio_FOUND)
target_link_libraries(boost_process INTERFACE boost::asio)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_process INTERFACE boost::core)
endif()
if(boost_tokenizer_FOUND)
target_link_libraries(boost_process INTERFACE boost::tokenizer)
endif()
if(boost_algorithm_FOUND)
target_link_libraries(boost_process INTERFACE boost::algorithm)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_process INTERFACE boost::iterator)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_process INTERFACE boost::config)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_process INTERFACE boost::move)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_process INTERFACE boost::system)
endif()
if(boost_winapi_FOUND)
target_link_libraries(boost_process INTERFACE boost::winapi)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_process INTERFACE boost::fusion)
endif()
if(boost_type_index_FOUND)
target_link_libraries(boost_process INTERFACE boost::type_index)
endif()
if(boost_filesystem_FOUND)
target_link_libraries(boost_process INTERFACE boost::filesystem)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_process INTERFACE boost::optional)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_process EXPORT boost_process-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_process-targets
  FILE boost_process-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_process
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_asio_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_asio)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_tokenizer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_tokenizer)
")
endif()
if(boost_algorithm_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_algorithm)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_winapi_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_winapi)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_type_index_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_type_index)
")
endif()
if(boost_filesystem_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_filesystem)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
find_package(boost_optional)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_process-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_process-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_process-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_process-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_process-config-version.cmake"
  DESTINATION lib/cmake/boost_process
)

