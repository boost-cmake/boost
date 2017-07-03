
cmake_minimum_required(VERSION 3.5)
project(boost_log)
include(CMakePackageConfigHelpers)

find_package(boost_iterator)
find_package(boost_property_tree)
find_package(boost_locale)
find_package(boost_move)
find_package(boost_type_index)
find_package(boost_atomic)
find_package(boost_io)
find_package(boost_array)
find_package(boost_utility)
find_package(boost_regex)
find_package(boost_static_assert)
find_package(boost_proto)
find_package(boost_predef)
find_package(boost_system)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_intrusive)
find_package(boost_config)
find_package(boost_core)
find_package(boost_random)
find_package(boost_phoenix)
find_package(boost_winapi)
find_package(boost_mpl)
find_package(boost_asio)
find_package(boost_assert)
find_package(boost_interprocess)
find_package(boost_fusion)
find_package(boost_preprocessor)
find_package(boost_parameter)
find_package(boost_optional)
find_package(boost_spirit)
find_package(boost_xpressive)
find_package(boost_date_time)
find_package(boost_exception)
find_package(boost_thread)
find_package(boost_bind)
find_package(boost_align)
find_package(boost_function_types)
find_package(boost_range)
find_package(boost_filesystem)
find_package(boost_lexical_cast)
find_package(boost_throw_exception)

add_library(boost_log 
src/named_scope.cpp
src/default_attribute_names.cpp
src/exceptions.cpp
src/threadsafe_queue.cpp
src/default_sink.cpp
src/permissions.cpp
src/unhandled_exception_count.cpp
src/timer.cpp
src/attribute_value_set.cpp
src/once_block.cpp
src/record_ostream.cpp
src/dump.cpp
src/event.cpp
src/attribute_set.cpp
src/trivial.cpp
src/process_name.cpp
src/thread_id.cpp
src/date_time_format_parser.cpp
src/text_ostream_backend.cpp
src/named_scope_format_parser.cpp
src/thread_specific.cpp
src/text_multifile_backend.cpp
src/core.cpp
src/text_file_backend.cpp
src/process_id.cpp
src/code_conversion.cpp
src/severity_level.cpp
src/global_logger_storage.cpp
src/format_parser.cpp
src/syslog_backend.cpp
src/attribute_name.cpp
src/spirit_encoding.cpp
src/timestamp.cpp
)
add_library(boost::log ALIAS boost_log)
set_property(TARGET boost_log PROPERTY EXPORT_NAME log)

target_include_directories(boost_log PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_iterator_FOUND)
target_link_libraries(boost_log PUBLIC boost::iterator)
endif()
if(boost_property_tree_FOUND)
target_link_libraries(boost_log PUBLIC boost::property_tree)
endif()
if(boost_locale_FOUND)
target_link_libraries(boost_log PUBLIC boost::locale)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_log PUBLIC boost::move)
endif()
if(boost_type_index_FOUND)
target_link_libraries(boost_log PUBLIC boost::type_index)
endif()
if(boost_atomic_FOUND)
target_link_libraries(boost_log PUBLIC boost::atomic)
endif()
if(boost_io_FOUND)
target_link_libraries(boost_log PUBLIC boost::io)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_log PUBLIC boost::array)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_log PUBLIC boost::utility)
endif()
if(boost_regex_FOUND)
target_link_libraries(boost_log PUBLIC boost::regex)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_log PUBLIC boost::static_assert)
endif()
if(boost_proto_FOUND)
target_link_libraries(boost_log PUBLIC boost::proto)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_log PUBLIC boost::predef)
endif()
if(boost_system_FOUND)
target_link_libraries(boost_log PUBLIC boost::system)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_log PUBLIC boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_log PUBLIC boost::smart_ptr)
endif()
if(boost_intrusive_FOUND)
target_link_libraries(boost_log PUBLIC boost::intrusive)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_log PUBLIC boost::config)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_log PUBLIC boost::core)
endif()
if(boost_random_FOUND)
target_link_libraries(boost_log PUBLIC boost::random)
endif()
if(boost_phoenix_FOUND)
target_link_libraries(boost_log PUBLIC boost::phoenix)
endif()
if(boost_winapi_FOUND)
target_link_libraries(boost_log PUBLIC boost::winapi)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_log PUBLIC boost::mpl)
endif()
if(boost_asio_FOUND)
target_link_libraries(boost_log PUBLIC boost::asio)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_log PUBLIC boost::assert)
endif()
if(boost_interprocess_FOUND)
target_link_libraries(boost_log PUBLIC boost::interprocess)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_log PUBLIC boost::fusion)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_log PUBLIC boost::preprocessor)
endif()
if(boost_parameter_FOUND)
target_link_libraries(boost_log PUBLIC boost::parameter)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_log PUBLIC boost::optional)
endif()
if(boost_spirit_FOUND)
target_link_libraries(boost_log PUBLIC boost::spirit)
endif()
if(boost_xpressive_FOUND)
target_link_libraries(boost_log PUBLIC boost::xpressive)
endif()
if(boost_date_time_FOUND)
target_link_libraries(boost_log PUBLIC boost::date_time)
endif()
if(boost_exception_FOUND)
target_link_libraries(boost_log PUBLIC boost::exception)
endif()
if(boost_thread_FOUND)
target_link_libraries(boost_log PUBLIC boost::thread)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_log PUBLIC boost::bind)
endif()
if(boost_align_FOUND)
target_link_libraries(boost_log PUBLIC boost::align)
endif()
if(boost_function_types_FOUND)
target_link_libraries(boost_log PUBLIC boost::function_types)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_log PUBLIC boost::range)
endif()
if(boost_filesystem_FOUND)
target_link_libraries(boost_log PUBLIC boost::filesystem)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_log PUBLIC boost::lexical_cast)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_log PUBLIC boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_log EXPORT boost_log-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_log-targets
  FILE boost_log-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_log
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_property_tree_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_property_tree)
")
endif()
if(boost_locale_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_locale)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_type_index_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_type_index)
")
endif()
if(boost_atomic_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_atomic)
")
endif()
if(boost_io_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_io)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_regex_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_regex)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_proto_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_proto)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_system_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_system)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_intrusive_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_intrusive)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_random_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_random)
")
endif()
if(boost_phoenix_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_phoenix)
")
endif()
if(boost_winapi_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_winapi)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_asio_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_asio)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_interprocess_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_interprocess)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_parameter_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_parameter)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_spirit_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_spirit)
")
endif()
if(boost_xpressive_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_xpressive)
")
endif()
if(boost_date_time_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_date_time)
")
endif()
if(boost_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_exception)
")
endif()
if(boost_thread_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_thread)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_align_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_align)
")
endif()
if(boost_function_types_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_function_types)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_filesystem_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_filesystem)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_log-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_log-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_log-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_log-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_log-config-version.cmake"
  DESTINATION lib/cmake/boost_log
)

