
cmake_minimum_required(VERSION 3.5)
project(boost_date_time)
include(CMakePackageConfigHelpers)

find_package(boost_static_assert)
find_package(boost_tokenizer)
find_package(boost_algorithm)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_io)
find_package(boost_serialization)
find_package(boost_lexical_cast)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

add_library(boost_date_time INTERFACE
)
add_library(boost::date_time ALIAS boost_date_time)
set_property(TARGET boost_date_time PROPERTY EXPORT_NAME date_time)

target_include_directories(boost_date_time INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_static_assert_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::static_assert)
endif()
if(boost_tokenizer_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::tokenizer)
endif()
if(boost_algorithm_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::algorithm)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::mpl)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::assert)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::smart_ptr)
endif()
if(boost_io_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::io)
endif()
if(boost_serialization_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::serialization)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::lexical_cast)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::throw_exception)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_date_time INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_date_time EXPORT boost_date_time-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_date_time-targets
  FILE boost_date_time-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_date_time
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_tokenizer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_tokenizer)
")
endif()
if(boost_algorithm_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_algorithm)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_io_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_io)
")
endif()
if(boost_serialization_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_serialization)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_date_time-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_date_time-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_date_time-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_date_time-config-version.cmake"
  DESTINATION lib/cmake/boost_date_time
)

