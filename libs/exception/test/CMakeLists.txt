include(BCMTest)

find_package(boost_function)
find_package(boost_thread)
find_package(boost_bind)

bcm_test_link_libraries(boost_exception
boost::function
boost::thread
boost::bind
)

# Boost Exception Library test Jamfile
#
# Copyright (c) 2006-2013 Emil Dotchevski and Reverge Studios, Inc.
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)



#to_string

bcm_test(NAME is_output_streamable_test SOURCES is_output_streamable_test.cpp)
bcm_test(NAME has_to_string_test SOURCES has_to_string_test.cpp)
bcm_test(NAME to_string_test SOURCES to_string_test.cpp)
bcm_test(NAME to_string_stub_test SOURCES to_string_stub_test.cpp)
bcm_test(NAME to_string_fail SOURCES to_string_fail.cpp COMPILE_ONLY WILL_FAIL)

#exception

bcm_test(NAME 1-throw_exception_test SOURCES 1-throw_exception_test.cpp)
bcm_test(NAME 2-throw_exception_no_exceptions_test SOURCES 2-throw_exception_no_exceptions_test.cpp)
bcm_test(NAME 3-throw_exception_no_integration_test SOURCES 3-throw_exception_no_integration_test.cpp)
bcm_test(NAME 4-throw_exception_no_both_test SOURCES 4-throw_exception_no_both_test.cpp)
bcm_test(NAME cloning_test SOURCES cloning_test.cpp)
bcm_test(NAME copy_exception_test SOURCES copy_exception_test.cpp)
bcm_test(NAME unknown_exception_test SOURCES unknown_exception_test.cpp)
bcm_test(NAME exception_test SOURCES exception_test.cpp)
# bcm_test(NAME enable_error_info_test SOURCES enable_error_info_test.cpp)
# bcm_test(NAME throw_exception_test SOURCES throw_exception_test.cpp)
bcm_test(NAME errno_test SOURCES errno_test.cpp)
bcm_test(NAME error_info_lv_test SOURCES error_info_lv_test.cpp)
bcm_test(NAME error_info_lv_const_test SOURCES error_info_lv_const_test.cpp)
bcm_test(NAME error_info_rv_test SOURCES error_info_rv_test.cpp)
bcm_test(NAME error_info_rv_const_test SOURCES error_info_rv_const_test.cpp)
bcm_test(NAME diagnostic_information_test SOURCES diagnostic_information_test.cpp)
bcm_test(NAME refcount_ptr_test SOURCES refcount_ptr_test.cpp)
bcm_test(NAME current_exception_cast_test SOURCES current_exception_cast_test.cpp)
bcm_test(NAME no_exceptions_test SOURCES no_exceptions_test.cpp)
set_target_properties(no_exceptions_test PROPERTIES CXX_EXCEPTIONS off)
bcm_test(NAME errinfos_test SOURCES errinfos_test.cpp)
bcm_test(NAME non_intrusive_exception_ptr_test SOURCES exception_ptr_test.cpp)
target_compile_definitions(non_intrusive_exception_ptr_test PUBLIC BOOST_ENABLE_NON_INTRUSIVE_EXCEPTION_PTR)
bcm_test(NAME exception_ptr_test SOURCES exception_ptr_test.cpp)
bcm_test(NAME N3757_test SOURCES N3757_test.cpp)

bcm_test(NAME exception_fail SOURCES exception_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME throw_exception_fail SOURCES throw_exception_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME error_info_const_fail SOURCES error_info_const_fail.cpp COMPILE_ONLY WILL_FAIL)

#headers

bcm_test(NAME exception_ptr_hpp_test SOURCES exception_ptr_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME diagnostic_information_hpp_test SOURCES diagnostic_information_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME error_info_hpp_test SOURCES error_info_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME get_error_info_hpp_test SOURCES get_error_info_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME info_hpp_test SOURCES info_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME info_tuple_hpp_test SOURCES info_tuple_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME to_string_hpp_test SOURCES to_string_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME to_string_stub_hpp_test SOURCES to_string_stub_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME all_hpp_test SOURCES all_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME current_exception_cast_hpp_test SOURCES current_exception_cast_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME errinfo_api_function_hpp_test SOURCES errinfo_api_function_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME errinfo_at_line_hpp_test SOURCES errinfo_at_line_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME errinfo_errno_hpp_test SOURCES errinfo_errno_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME errinfo_file_handle_hpp_test SOURCES errinfo_file_handle_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME errinfo_file_name_hpp_test SOURCES errinfo_file_name_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME errinfo_file_open_mode_hpp_test SOURCES errinfo_file_open_mode_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME errinfo_nested_exception_hpp_test SOURCES errinfo_nested_exception_hpp_test.cpp COMPILE_ONLY)
bcm_test(NAME errinfo_type_info_name_hpp_test SOURCES errinfo_type_info_name_hpp_test.cpp COMPILE_ONLY)

