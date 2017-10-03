cmake_minimum_required(VERSION 3.5)
project(boost_log)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_predef)
find_package(boost_property_tree)
find_package(boost_locale)
find_package(boost_move)
find_package(boost_xpressive)
find_package(boost_type_index)
find_package(boost_atomic)
find_package(boost_io)
find_package(boost_array)
find_package(boost_iterator)
find_package(boost_utility)
find_package(boost_regex)
find_package(boost_static_assert)
find_package(boost_bind)
find_package(boost_proto)
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
find_package(boost_optional)
find_package(boost_spirit)
find_package(boost_function_types)
find_package(boost_date_time)
find_package(boost_exception)
find_package(boost_thread)
find_package(boost_parameter)
find_package(boost_align)
find_package(boost_range)
find_package(boost_filesystem)
find_package(boost_lexical_cast)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_log 
src/thread_id.cpp
src/attribute_set.cpp
src/format_parser.cpp
src/event.cpp
src/global_logger_storage.cpp
src/thread_specific.cpp
src/unhandled_exception_count.cpp
src/severity_level.cpp
src/text_multifile_backend.cpp
src/permissions.cpp
src/once_block.cpp
src/threadsafe_queue.cpp
src/timer.cpp
src/exceptions.cpp
src/timestamp.cpp
src/process_name.cpp
src/default_sink.cpp
src/syslog_backend.cpp
src/date_time_format_parser.cpp
src/process_id.cpp
src/record_ostream.cpp
src/core.cpp
src/default_attribute_names.cpp
src/text_file_backend.cpp
src/attribute_name.cpp
src/attribute_value_set.cpp
src/text_ostream_backend.cpp
src/spirit_encoding.cpp
src/code_conversion.cpp
src/trivial.cpp
src/dump.cpp
src/named_scope_format_parser.cpp
src/named_scope.cpp
)
set_property(TARGET boost_log PROPERTY EXPORT_NAME log)

target_link_libraries(boost_log PUBLIC boost::predef)
target_link_libraries(boost_log PUBLIC boost::property_tree)
target_link_libraries(boost_log PUBLIC boost::locale)
target_link_libraries(boost_log PUBLIC boost::move)
target_link_libraries(boost_log PUBLIC boost::xpressive)
target_link_libraries(boost_log PUBLIC boost::type_index)
target_link_libraries(boost_log PUBLIC boost::atomic)
target_link_libraries(boost_log PUBLIC boost::io)
target_link_libraries(boost_log PUBLIC boost::array)
target_link_libraries(boost_log PUBLIC boost::iterator)
target_link_libraries(boost_log PUBLIC boost::utility)
target_link_libraries(boost_log PUBLIC boost::regex)
target_link_libraries(boost_log PUBLIC boost::static_assert)
target_link_libraries(boost_log PUBLIC boost::bind)
target_link_libraries(boost_log PUBLIC boost::proto)
target_link_libraries(boost_log PUBLIC boost::system)
target_link_libraries(boost_log PUBLIC boost::type_traits)
target_link_libraries(boost_log PUBLIC boost::smart_ptr)
target_link_libraries(boost_log PUBLIC boost::intrusive)
target_link_libraries(boost_log PUBLIC boost::config)
target_link_libraries(boost_log PUBLIC boost::core)
target_link_libraries(boost_log PUBLIC boost::random)
target_link_libraries(boost_log PUBLIC boost::phoenix)
target_link_libraries(boost_log PUBLIC boost::winapi)
target_link_libraries(boost_log PUBLIC boost::mpl)
target_link_libraries(boost_log PUBLIC boost::asio)
target_link_libraries(boost_log PUBLIC boost::assert)
target_link_libraries(boost_log PUBLIC boost::interprocess)
target_link_libraries(boost_log PUBLIC boost::fusion)
target_link_libraries(boost_log PUBLIC boost::preprocessor)
target_link_libraries(boost_log PUBLIC boost::optional)
target_link_libraries(boost_log PUBLIC boost::spirit)
target_link_libraries(boost_log PUBLIC boost::function_types)
target_link_libraries(boost_log PUBLIC boost::date_time)
target_link_libraries(boost_log PUBLIC boost::exception)
target_link_libraries(boost_log PUBLIC boost::thread)
target_link_libraries(boost_log PUBLIC boost::parameter)
target_link_libraries(boost_log PUBLIC boost::align)
target_link_libraries(boost_log PUBLIC boost::range)
target_link_libraries(boost_log PUBLIC boost::filesystem)
target_link_libraries(boost_log PUBLIC boost::lexical_cast)
target_link_libraries(boost_log PUBLIC boost::throw_exception)

target_compile_definitions(boost_log PUBLIC
__STDC_CONSTANT_MACROS # Use system-defined macros for integer constants, if possible
BOOST_SPIRIT_USE_PHOENIX_V3=1
)
if(MSVC)
# Disable warnings about using 'insecure' standard C functions
target_compile_definitions(boost_log PUBLIC
_SCL_SECURE_NO_WARNINGS
_SCL_SECURE_NO_DEPRECATE
_CRT_SECURE_NO_WARNINGS
_CRT_SECURE_NO_DEPRECATE
)
target_compile_options(boost_log PUBLIC
/bigobj
/wd4503 # decorated name length exceeded, name was truncated
/wd4456 # declaration of 'A' hides previous local declaration
/wd4459 # declaration of 'A' hides global declaration
/wd4003 # not enough actual parameters for macro 'X' - caused by BOOST_PP_IS_EMPTY and BOOST_PP_IS_BEGIN_PARENS which are used by Fusion
)
endif()

if (${CMAKE_C_COMPILER} MATCHES "icc.*$") 
# Disable Intel warnings:
# warning #177: function "X" was declared but never referenced
# warning #780: using-declaration ignored -- it refers to the current namespace
# warning #2196: routine is both "inline" and "noinline"
# remark #1782: #pragma once is obsolete. Use #ifndef guard instead.
# remark #193: zero used for undefined preprocessing identifier "X"
# remark #304: access control not specified ("public" by default)
# remark #981: operands are evaluated in unspecified order
# remark #1418: external function definition with no prior declaration
# Mostly comes from Boost.Phoenix: warning #411: class "X" defines no constructor to initialize the following: reference member "Y"...
# warning #734: "X" (declared at line N of "file.hpp"), required for copy that was eliminated, is inaccessible
# warning #279: controlling expression is constant
if(MSVC)
target_compile_options(boost_log PRIVATE "/Qwd177,780,2196,1782,193,304,981,1418,411,734,279")
elseif(APPLE)
target_compile_options(boost_log PRIVATE "-wd177,780,2196,1782,193,304,981,1418,411,734,279")
elseif(UNIX)
target_compile_options(boost_log PRIVATE "-wd177,780,2196,1782,193,304,981,1418,411,734,279")
endif()
endif()

if(NOT MSVC)
target_compile_options(boost_log PUBLIC -ftemplate-depth-1024)
endif()

if(WIN32)
target_compile_definitions(boost_log PUBLIC
NOMINMAX
WIN32_LEAN_AND_MEAN
SECURITY_WIN32
BOOST_USE_WINDOWS_H
)
target_link_libraries(boost_log PUBLIC
-lws2_32
-lmswsock
-ladvapi32
)
endif()

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
target_compile_definitions(boost_log PUBLIC _XOPEN_SOURCE=600)
target_link_libraries(boost_log PUBLIC -lrt)
endif()

if(WIN32)
    target_sources(boost_log PRIVATE src/windows/light_rw_mutex.cpp)
    if(NOT BOOST_LOG_WITHOUT_IPC)
    target_sources(boost_log PRIVATE
    src/windows/object_name.cpp
    src/windows/mapped_shared_memory.cpp
    src/windows/ipc_sync_wrappers.cpp
    src/windows/ipc_reliable_message_queue.cpp
    )
    target_link_libraries(boost_log PUBLIC -lsecur32)
    endif()
    if(NOT BOOST_LOG_WITHOUT_DEBUG_OUTPUT)
    target_sources(boost_log PRIVATE src/windows/debug_output_backend.cpp)
    endif()
    if(NOT BOOST_LOG_WITHOUT_EVENT_LOG)
    target_sources(boost_log PRIVATE
    src/windows/simple_event_log.mc
    src/windows/event_log_backend.cpp
    )
    target_link_libraries(boost_log PUBLIC -lpsapi)
    endif()
else()
    target_compile_definitions(boost_log PUBLIC BOOST_LOG_WITHOUT_EVENT_LOG BOOST_LOG_WITHOUT_DEBUG_OUTPUT)
    target_sources(boost_log PRIVATE
    src/posix/object_name.cpp
    src/posix/ipc_reliable_message_queue.cpp
    )
endif()

target_compile_definitions(boost_log PUBLIC BOOST_LOG_BUILDING_THE_LIB=1)
target_include_directories(boost_log PRIVATE src/)

add_library(boost_log_setup
    src/setup/parser_utils.cpp
    src/setup/init_from_stream.cpp
    src/setup/init_from_settings.cpp
    src/setup/settings_parser.cpp
    src/setup/filter_parser.cpp
    src/setup/formatter_parser.cpp
    src/setup/default_filter_factory.cpp
    src/setup/matches_relation_factory.cpp
    src/setup/default_formatter_factory.cpp
)
target_compile_definitions(boost_log_setup PUBLIC BOOST_LOG_SETUP_BUILDING_THE_LIB=1)
target_include_directories(boost_log_setup PRIVATE src)
target_link_libraries(boost_log_setup boost_log)


target_include_directories(boost_log PRIVATE include)

bcm_deploy(TARGETS boost_log INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
