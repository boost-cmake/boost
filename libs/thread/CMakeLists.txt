
cmake_minimum_required(VERSION 3.5)
project(boost_thread)
include(CMakePackageConfigHelpers)

find_package(boost_predef)
find_package(boost_move)
find_package(boost_functional)
find_package(boost_concept_check)
find_package(boost_atomic)
find_package(boost_io)
find_package(boost_utility)
find_package(boost_static_assert)
find_package(boost_container)
find_package(boost_system)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_intrusive)
find_package(boost_config)
find_package(boost_function)
find_package(boost_core)
find_package(boost_tuple)
find_package(boost_winapi)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_preprocessor)
find_package(boost_optional)
find_package(boost_date_time)
find_package(boost_exception)
find_package(boost_algorithm)
find_package(boost_chrono)
find_package(boost_bind)
find_package(boost_lexical_cast)
find_package(boost_throw_exception)

add_library(boost_thread 
src/tss_null.cpp
src/future.cpp
)
add_library(boost::thread ALIAS boost_thread)
set_property(TARGET boost_thread PROPERTY EXPORT_NAME thread)

target_include_directories(boost_thread PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_predef_FOUND)
target_link_libraries(boost_thread PUBLIC boost::predef)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_thread PUBLIC boost::move)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_thread PUBLIC boost::functional)
endif()
if(boost_concept_check_FOUND)
target_link_libraries(boost_thread PUBLIC boost::concept_check)
endif()
if(boost_atomic_FOUND)
target_link_libraries(boost_thread PUBLIC boost::atomic)
endif()
if(boost_io_FOUND)
target_link_libraries(boost_thread PUBLIC boost::io)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_thread PUBLIC boost::utility)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_thread PUBLIC boost::static_assert)
endif()
if(boost_container_FOUND)
target_link_libraries(boost_thread PUBLIC boost::container)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_thread PUBLIC boost::system)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_thread PUBLIC boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_thread PUBLIC boost::smart_ptr)
endif()
if(boost_intrusive_FOUND)
target_link_libraries(boost_thread PUBLIC boost::intrusive)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_thread PUBLIC boost::config)
endif()
if(boost_function_FOUND)
target_link_libraries(boost_thread PUBLIC boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_thread PUBLIC boost::core)
endif()
if(boost_tuple_FOUND)
target_link_libraries(boost_thread PUBLIC boost::tuple)
endif()
if(boost_winapi_FOUND)
target_link_libraries(boost_thread PUBLIC boost::winapi)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_thread PUBLIC boost::mpl)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_thread PUBLIC boost::assert)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_thread PUBLIC boost::preprocessor)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_thread PUBLIC boost::optional)
endif()
if(boost_date_time_FOUND)
target_link_libraries(boost_thread PUBLIC boost::date_time)
endif()
if(boost_exception_FOUND)
target_link_libraries(boost_thread PUBLIC boost::exception)
endif()
if(boost_algorithm_FOUND)
target_link_libraries(boost_thread PUBLIC boost::algorithm)
endif()
if(boost_chrono_FOUND)
target_link_libraries(boost_thread PUBLIC boost::chrono)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_thread PUBLIC boost::bind)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_thread PUBLIC boost::lexical_cast)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_thread PUBLIC boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_thread EXPORT boost_thread-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_thread-targets
  FILE boost_thread-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_thread
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_concept_check_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_concept_check)
")
endif()
if(boost_atomic_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_atomic)
")
endif()
if(boost_io_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_io)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_container_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_container)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_intrusive_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_intrusive)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_tuple_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_tuple)
")
endif()
if(boost_winapi_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_winapi)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_date_time_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_date_time)
")
endif()
if(boost_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_exception)
")
endif()
if(boost_algorithm_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_algorithm)
")
endif()
if(boost_chrono_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_chrono)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_thread-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_thread-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_thread-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_thread-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_thread-config-version.cmake"
  DESTINATION lib/cmake/boost_thread
)

