
cmake_minimum_required(VERSION 3.5)
project(boost_tokenizer)
include(CMakePackageConfigHelpers)

find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_config)
find_package(boost_throw_exception)

add_library(boost_tokenizer INTERFACE
)
add_library(boost::tokenizer ALIAS boost_tokenizer)
set_property(TARGET boost_tokenizer PROPERTY EXPORT_NAME tokenizer)

target_include_directories(boost_tokenizer INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_iterator_FOUND)
target_link_libraries(boost_tokenizer INTERFACE boost::iterator)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_tokenizer INTERFACE boost::mpl)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_tokenizer INTERFACE boost::assert)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_tokenizer INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_tokenizer INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_tokenizer EXPORT boost_tokenizer-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_tokenizer-targets
  FILE boost_tokenizer-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_tokenizer
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_tokenizer-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tokenizer-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tokenizer-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tokenizer-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tokenizer-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_tokenizer-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_tokenizer-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_tokenizer-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_tokenizer-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_tokenizer-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_tokenizer-config-version.cmake"
  DESTINATION lib/cmake/boost_tokenizer
)

