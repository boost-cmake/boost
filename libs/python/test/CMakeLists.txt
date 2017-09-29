include(BCMTest)

find_package(boost_assert)

bcm_test_link_libraries(boost_python
boost::assert
)

# Copyright David Abrahams 2006. Distributed under the Boost
# Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


# TODO



# A bug in the Win32 intel compilers causes compilation of one of our
# tests to take forever when debug symbols are enabled. This rule
# turns them off when added to the requirements section









# Turn off this test on HP CXX, as the test hangs when executing.
# Whenever the cause for the failure of the polymorphism test is found
# and fixed, this should be retested.



# if $(TEST_BIENSTMAN_NON_BUGS)
# {
#     bpl-test bienstman4 ;
#     bpl-test bienstman5 ;
# }


# --- unit tests of library components ---









# --- NumPy tests ---



bcm_test(NAME exec SOURCES exec.cpp ARGS exec.py)
bcm_test(NAME import_ SOURCES import_.cpp ARGS import_.py)
bcm_test(NAME indirect_traits_test SOURCES indirect_traits_test.cpp COMPILE_ONLY)
bcm_test(NAME destroy_test SOURCES destroy_test.cpp)
bcm_test(NAME if_else SOURCES if_else.cpp)
bcm_test(NAME result SOURCES result.cpp)
bcm_test(NAME string_literal SOURCES string_literal.cpp COMPILE_ONLY)
bcm_test(NAME select_from_python_test SOURCES select_from_python_test.cpp)
target_compile_definitions(select_from_python_test PUBLIC BOOST_PYTHON_STATIC_LIB)

