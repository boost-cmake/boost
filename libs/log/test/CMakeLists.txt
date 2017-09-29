include(BCMTest)

find_package(boost_detail)
find_package(boost_test)
find_package(boost_chrono)

bcm_test_link_libraries(boost_log
boost::detail
boost::test
boost::chrono
)

#
#          Copyright Andrey Semashev 2007 - 2015.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)
#
# The file was adapted from libs/tr2/test/Jamfile.v2 by John Maddock.

add_library(boost_log_test_common INTERFACE)
target_include_directories(boost_log_test_common INTERFACE common)
bcm_test_link_libraries(boost_log_test_common boost_log_setup)


# Disable warnings about using 'insecure' standard C functions


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



# Testers typically don't specify threading environment and the library can be built and tested for single and multi. I'm more interested in multi though.
#        <link>static

# this rule enumerates through all the sources and invokes
# the run rule for each source, the result is a list of all
# the run rules, which we can pass on to the test_suite rule:
file(GLOB_RECURSE HEADERS RELATIVE ../include ../include/*.hpp)
foreach(HEADER ${HEADERS})
    if(NOT "${HEADER}" MATCHES "detail")
        get_filename_component(NAME ${HEADER} NAME_WE)
        bcm_test_header(NAME log-header-${NAME} HEADER ${HEADER} STATIC)
    endif()
endforeach()

file(GLOB COMPILE_TEST_FILES compile/*.cpp)
foreach(FILEB ${COMPILE_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    if(NOT "${NAME}" MATCHES "self_contained_header")
        bcm_test(NAME log-compile-${NAME} SOURCES ${FILEB} COMPILE_ONLY)
    endif()
endforeach()


file(GLOB COMPILE_TEST_FILES compile_fail/*.cpp)
foreach(FILEB ${COMPILE_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    if(NOT "${NAME}" MATCHES "self_contained_header")
        bcm_test(NAME log-compile_fail-${NAME} SOURCES ${FILEB} COMPILE_ONLY WILL_FAIL)
    endif()
endforeach()

file(GLOB COMPILE_TEST_FILES run/*.cpp)
foreach(FILEB ${COMPILE_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    bcm_test(NAME log-run-${NAME} SOURCES ${FILEB})
endforeach()

