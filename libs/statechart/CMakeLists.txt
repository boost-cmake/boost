
cmake_minimum_required(VERSION 3.5)
project(boost_statechart)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_thread)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_conversion)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_config)

add_library(boost_statechart INTERFACE
)
add_library(boost::statechart ALIAS boost_statechart)
set_property(TARGET boost_statechart PROPERTY EXPORT_NAME statechart)

target_include_directories(boost_statechart INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::static_assert)
endif()
if(boost_thread_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::thread)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::mpl)
endif()
if(boost_conversion_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::conversion)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::detail)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::smart_ptr)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_statechart INTERFACE boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_statechart EXPORT boost_statechart-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_statechart-targets
  FILE boost_statechart-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_statechart
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_thread_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_thread)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_conversion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_conversion)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_statechart-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_statechart-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_statechart-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_statechart-config-version.cmake"
  DESTINATION lib/cmake/boost_statechart
)

