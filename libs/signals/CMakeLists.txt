
cmake_minimum_required(VERSION 3.5)
project(boost_signals)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_iterator)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_any)
find_package(boost_utility)

add_library(boost_signals 
src/named_slot_map.cpp
src/trackable.cpp
src/slot.cpp
src/connection.cpp
src/signal_base.cpp
)
add_library(boost::signals ALIAS boost_signals)
set_property(TARGET boost_signals PROPERTY EXPORT_NAME signals)

target_include_directories(boost_signals PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_signals PUBLIC boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_signals PUBLIC boost::core)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_signals PUBLIC boost::iterator)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_signals PUBLIC boost::optional)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_signals PUBLIC boost::mpl)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_signals PUBLIC boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_signals PUBLIC boost::smart_ptr)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_signals PUBLIC boost::config)
endif()
if(boost_any_FOUND)
target_link_libraries(boost_signals PUBLIC boost::any)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_signals PUBLIC boost::utility)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_signals EXPORT boost_signals-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_signals-targets
  FILE boost_signals-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_signals
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_any_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "
find_package(boost_any)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "
find_package(boost_utility)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_signals-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_signals-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_signals-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_signals-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_signals-config-version.cmake"
  DESTINATION lib/cmake/boost_signals
)

