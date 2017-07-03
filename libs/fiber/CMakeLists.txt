
cmake_minimum_required(VERSION 3.5)
project(boost_fiber)
include(CMakePackageConfigHelpers)

find_package(boost_predef)
find_package(boost_assert)
find_package(boost_smart_ptr)
find_package(boost_context)
find_package(boost_intrusive)
find_package(boost_config)

add_library(boost_fiber 
src/condition_variable.cpp
src/timed_mutex.cpp
src/future.cpp
src/recursive_timed_mutex.cpp
src/mutex.cpp
src/properties.cpp
src/scheduler.cpp
src/recursive_mutex.cpp
src/context.cpp
src/fiber.cpp
src/barrier.cpp
)
add_library(boost::fiber ALIAS boost_fiber)
set_property(TARGET boost_fiber PROPERTY EXPORT_NAME fiber)

target_include_directories(boost_fiber PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_predef_FOUND)
target_link_libraries(boost_fiber PUBLIC boost::predef)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_fiber PUBLIC boost::assert)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_fiber PUBLIC boost::smart_ptr)
endif()
if(boost_context_FOUND)
target_link_libraries(boost_fiber PUBLIC boost::context)
endif()
if(boost_intrusive_FOUND)
target_link_libraries(boost_fiber PUBLIC boost::intrusive)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_fiber PUBLIC boost::config)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_fiber EXPORT boost_fiber-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_fiber-targets
  FILE boost_fiber-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_fiber
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_fiber-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fiber-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fiber-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fiber-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_context_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fiber-config.cmake" "
find_package(boost_context)
")
endif()
if(boost_intrusive_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fiber-config.cmake" "
find_package(boost_intrusive)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_fiber-config.cmake" "
find_package(boost_config)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_fiber-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_fiber-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_fiber-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_fiber-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_fiber-config-version.cmake"
  DESTINATION lib/cmake/boost_fiber
)

