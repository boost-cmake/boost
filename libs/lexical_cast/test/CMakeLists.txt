include(BCMTest)

find_package(boost_date_time)
find_package(boost_filesystem)
find_package(boost_test)

bcm_test_link_libraries(boost_lexical_cast
boost::date_time
boost::filesystem
boost::test
)

# Copyright (C) 2001-2003 Douglas Gregor
# Copyright (C) 2011-2017 Antony Polukhin
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#

include(CheckCXXCompilerFlag)

add_library(test_lexical_cast_flags INTERFACE)
bcm_test_link_libraries(test_lexical_cast_flags)

check_cxx_compiler_flag("-ftrapv" COMPILER_HAS_CXX_FLAG_ftrapv)
if(COMPILER_HAS_CXX_FLAG_ftrapv)
target_compile_options(test_lexical_cast_flags INTERFACE -ftrapv)
endif()

# default to all warnings on:
set_directory_properties(PROPERTIES CXX_WARNINGS ON)
# Not a lexical_cast related warning: boost/preprocessor/variadic/elem.hpp:29:46: warning: variadic macros are a C99 feature
# Not a lexical_cast related warning: boost/mpl/aux_/preprocessed/gcc/greater_equal.hpp:78:1: warning: empty macro arguments are a C99 feature [-Wc99-extensions]
#                                     boost/mpl/iter_fold.hpp:45:1: warning: empty macro arguments are a C99 feature [-Wc99-extensions]
if(NOT MSVC)
target_compile_options(test_lexical_cast_flags INTERFACE -Wextra -Wno-variadic-macros -Wno-c99-extensions)
endif()

# Thanks to Steven Watanabe for helping with <nowchar> feature
# TODO: Check for wchar

bcm_test(NAME lexical_cast_test SOURCES lexical_cast_test.cpp)
bcm_test(NAME lexical_cast_loopback_test SOURCES lexical_cast_loopback_test.cpp)
bcm_test(NAME lexical_cast_abstract_test SOURCES lexical_cast_abstract_test.cpp)
bcm_test(NAME lexical_cast_noncopyable_test SOURCES lexical_cast_noncopyable_test.cpp)
bcm_test(NAME lexical_cast_vc8_bug_test SOURCES lexical_cast_vc8_bug_test.cpp)
bcm_test(NAME lexical_cast_wchars_test SOURCES lexical_cast_wchars_test.cpp)
bcm_test(NAME lexical_cast_float_types_test SOURCES lexical_cast_float_types_test.cpp)
bcm_test(NAME lexical_cast_inf_nan_test SOURCES lexical_cast_inf_nan_test.cpp)
bcm_test(NAME lexical_cast_containers_test SOURCES lexical_cast_containers_test.cpp)
bcm_test(NAME lexical_cast_empty_input_test SOURCES lexical_cast_empty_input_test.cpp)
bcm_test(NAME lexical_cast_pointers_test SOURCES lexical_cast_pointers_test.cpp)
bcm_test(NAME lexical_cast_typedefed_wchar_test SOURCES lexical_cast_typedefed_wchar_test.cpp COMPILE_ONLY)
bcm_test(NAME lexical_cast_typedefed_wchar_test_runtime SOURCES lexical_cast_typedefed_wchar_test_runtime.cpp)
bcm_test(NAME lexical_cast_no_locale_test SOURCES lexical_cast_no_locale_test.cpp)
target_compile_definitions(lexical_cast_no_locale_test PUBLIC BOOST_NO_STD_LOCALE BOOST_LEXICAL_CAST_ASSUME_C_LOCALE)
bcm_test(NAME lexical_cast_no_exceptions_test SOURCES lexical_cast_no_exceptions_test.cpp)
target_compile_definitions(lexical_cast_no_exceptions_test PUBLIC BOOST_NO_EXCEPTIONS)
set_target_properties(lexical_cast_no_exceptions_test PROPERTIES CXX_EXCEPTIONS Off)
bcm_test(NAME lexical_cast_iterator_range_test SOURCES lexical_cast_iterator_range_test.cpp)
bcm_test(NAME lexical_cast_arrays_test SOURCES lexical_cast_arrays_test.cpp)
if(MSVC)
target_compile_definitions(lexical_cast_arrays_test PUBLIC /wd4512) # assignment operator could not be generated
endif()
bcm_test(NAME lexical_cast_integral_types_test SOURCES lexical_cast_integral_types_test.cpp)
bcm_test(NAME lexical_cast_stream_detection_test SOURCES lexical_cast_stream_detection_test.cpp)
bcm_test(NAME lexical_cast_stream_traits_test SOURCES lexical_cast_stream_traits_test.cpp)
bcm_test(NAME lexical_cast_to_pointer_test SOURCES lexical_cast_to_pointer_test.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME lexical_cast_filesystem_test SOURCES lexical_cast_filesystem_test.cpp)
bcm_test(NAME lexical_cast_try_lexical_convert SOURCES lexical_cast_try_lexical_convert.cpp)
bcm_test(NAME lexical_cast_no_comp_time_prcision SOURCES lexical_cast_no_comp_time_prcision.cpp)
target_compile_definitions(lexical_cast_no_comp_time_prcision PUBLIC )

# Assuring that examples compile and run. Adding sources from `example` directory to the `conversion` test suite.
file(GLOB BOOST_LEXICAL_CAST_EXAMPLES ../example/*.cpp)
foreach(EXAMPLE ${BOOST_LEXICAL_CAST_EXAMPLES})
    get_filename_component(NAME ${EXAMPLE} NAME_WE)
    bcm_test(NAME intrusive-${NAME} SOURCES ${EXAMPLE})
endforeach()


