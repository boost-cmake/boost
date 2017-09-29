include(BCMTest)

find_package(boost_filesystem)
find_package(boost_test)
find_package(boost_lexical_cast)

bcm_test_link_libraries(boost_iostreams
boost::filesystem
boost::test
boost::lexical_cast
)

# Boost.Iostreams Library test Jamfile

# (C) Copyright 2008 CodeRage, LLC (turkanis at coderage dot com)
# (C) Copyright 2004-2007 Jonathan Turkanis
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt.)

# See http://www.boost.org/libs/iostreams for documentation.

add_library(test-iostreams-flags INTERFACE)
bcm_mark_as_test(test-iostreams-flags)
bcm_test_link_libraries(test-iostreams-flags)
target_compile_definitions(test-iostreams-flags INTERFACE BOOST_IOSTREAMS_NO_LIB)


bcm_test(NAME array_test SOURCES array_test.cpp)
bcm_test(NAME auto_close_test SOURCES auto_close_test.cpp)
bcm_test(NAME buffer_size_test SOURCES buffer_size_test.cpp)
bcm_test(NAME close_test SOURCES close_test.cpp)
bcm_test(NAME code_converter_test SOURCES code_converter_test.cpp detail/utf8_codecvt_facet.cpp)

bcm_test(NAME combine_test SOURCES combine_test.cpp)
bcm_test(NAME compose_test SOURCES compose_test.cpp)
bcm_test(NAME component_access_test SOURCES component_access_test.cpp)
bcm_test(NAME copy_test SOURCES copy_test.cpp)
bcm_test(NAME counter_test SOURCES counter_test.cpp)
bcm_test(NAME direct_adapter_test SOURCES direct_adapter_test.cpp)
bcm_test(NAME dual_seekable_test SOURCES dual_seekable_test.cpp)
bcm_test(NAME example_test SOURCES example_test.cpp)
bcm_test(NAME execute_test SOURCES execute_test.cpp)
bcm_test(NAME file_test SOURCES file_test.cpp)
bcm_test(NAME file_descriptor_test SOURCES file_descriptor_test.cpp)


# bcm_test(NAME deprecated_file_descriptor_test SOURCES deprecated_file_descriptor_test.cpp)
# target_compile_definitions(deprecated_file_descriptor_test PUBLIC BOOST_IOSTREAMS_USE_DEPRECATED)
bcm_test(NAME deprecated_file_descriptor_test_fail SOURCES deprecated_file_descriptor_test.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME filtering_stream_test SOURCES filtering_stream_test.cpp)
bcm_test(NAME finite_state_filter_test SOURCES finite_state_filter_test.cpp)
bcm_test(NAME flush_test SOURCES flush_test.cpp)
bcm_test(NAME grep_test SOURCES grep_test.cpp)
bcm_test(NAME invert_test SOURCES invert_test.cpp)
bcm_test(NAME line_filter_test SOURCES line_filter_test.cpp)
bcm_test(NAME mapped_file_test SOURCES mapped_file_test.cpp)
bcm_test(NAME iostreams-path_test SOURCES path_test.cpp)
bcm_test(NAME newline_test SOURCES newline_test.cpp)
bcm_test(NAME null_test SOURCES null_test.cpp)
bcm_test(NAME operation_sequence_test SOURCES operation_sequence_test.cpp)
bcm_test(NAME pipeline_test SOURCES pipeline_test.cpp)
bcm_test(NAME regex_filter_test SOURCES regex_filter_test.cpp)
bcm_test(NAME restrict_test SOURCES restrict_test.cpp)
bcm_test(NAME seekable_file_test SOURCES seekable_file_test.cpp)
bcm_test(NAME seekable_filter_test SOURCES seekable_filter_test.cpp)
bcm_test(NAME sequence_test SOURCES sequence_test.cpp)
bcm_test(NAME slice_test SOURCES slice_test.cpp)
bcm_test(NAME stdio_filter_test SOURCES stdio_filter_test.cpp)
bcm_test(NAME stream_offset_32bit_test SOURCES stream_offset_32bit_test.cpp)
bcm_test(NAME stream_offset_64bit_test SOURCES stream_offset_64bit_test.cpp)
# bcm_test(NAME stream_state_test SOURCES stream_state_test.cpp)
bcm_test(NAME symmetric_filter_test SOURCES symmetric_filter_test.cpp)
bcm_test(NAME tee_test SOURCES tee_test.cpp)
bcm_test(NAME wide_stream_test SOURCES wide_stream_test.cpp)
if(WIN32)
bcm_test(NAME windows_pipe_test SOURCES windows_pipe_test.cpp)
endif()

if(BOOST_IOSTREAMS_LARGE_FILE_KEEP)
bcm_test(NAME large_file_keep_test SOURCES large_file_test.cpp ../src/file_descriptor.cpp ../src/mapped_file.cpp)
target_compile_definitions(large_file_test PUBLIC LARGE_FILE_KEEP=${BOOST_IOSTREAMS_LARGE_FILE_KEEP})
endif()

if(BOOST_IOSTREAMS_LARGE_FILE_TEMP)
bcm_test(NAME large_file_temp_test SOURCES large_file_test.cpp ../src/file_descriptor.cpp ../src/mapped_file.cpp)
target_compile_definitions(large_file_test PUBLIC LARGE_FILE_TEMP=${BOOST_IOSTREAMS_LARGE_FILE_TEMP})
endif()

if(ZLIB_FOUND)
bcm_test(NAME gzip_test SOURCES gzip_test.cpp)
bcm_test(NAME zlib_test SOURCES zlib_test.cpp)
endif()

if(BZip2_FOUND)
bcm_test(NAME bzip2_test SOURCES bzip2_test.cpp)
endif()

