
cmake_minimum_required(VERSION 3.5)
project(boost_icl)
include(CMakePackageConfigHelpers)

find_package(boost_date_time)
find_package(boost_static_assert)
find_package(boost_container)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_rational)
find_package(boost_core)
find_package(boost_config)
find_package(boost_utility)

add_library(boost_icl INTERFACE
)
add_library(boost::icl ALIAS boost_icl)
set_property(TARGET boost_icl PROPERTY EXPORT_NAME icl)

target_include_directories(boost_icl INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_date_time_FOUND)
target_link_libraries(boost_icl INTERFACE boost::date_time)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_icl INTERFACE boost::static_assert)
endif()
if(boost_container_FOUND)
target_link_libraries(boost_icl INTERFACE boost::container)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_icl INTERFACE boost::iterator)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_icl INTERFACE boost::mpl)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_icl INTERFACE boost::move)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_icl INTERFACE boost::detail)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_icl INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_icl INTERFACE boost::type_traits)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_icl INTERFACE boost::concept_check)
endif()
if(boost_rational_FOUND)
target_link_libraries(boost_icl INTERFACE boost::rational)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_icl INTERFACE boost::core)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_icl INTERFACE boost::config)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_icl INTERFACE boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_icl EXPORT boost_icl-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_icl-targets
  FILE boost_icl-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_icl
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_date_time_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_date_time)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_container_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_container)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_rational_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_rational)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_icl-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_icl-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_icl-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_icl-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_icl-config-version.cmake"
  DESTINATION lib/cmake/boost_icl
)

