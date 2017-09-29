include(BCMTest)

find_package(boost_test)

bcm_test_link_libraries(boost_numeric_interval
boost::test
)

# Boost Interval Library test Jamfile
#
# Copyright 2003 Guillaume Melquiond
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or
# copy at http://www.boost.org/LICENSE_1_0.txt)

# Enable dynamic rounding on Tru64 (Alpha CPU).

# bring in rules for testing



bcm_test(NAME libs_numeric_interval_test_integer SOURCES integer.cpp COMPILE_ONLY)
bcm_test(NAME libs_numeric_interval_test_add SOURCES add.cpp)
bcm_test(NAME libs_numeric_interval_test_det SOURCES det.cpp)
bcm_test(NAME libs_numeric_interval_test_fmod SOURCES fmod.cpp)
bcm_test(NAME libs_numeric_interval_test_msvc_x64_flags SOURCES msvc_x64_flags.cpp)
bcm_test(NAME libs_numeric_interval_test_mul SOURCES mul.cpp)
bcm_test(NAME libs_numeric_interval_test_overflow SOURCES overflow.cpp)
bcm_test(NAME libs_numeric_interval_test_pi SOURCES pi.cpp)
bcm_test(NAME libs_numeric_interval_test_pow SOURCES pow.cpp)

bcm_test(NAME libs_numeric_interval_test_cmp SOURCES cmp.cpp)
target_link_libraries(libs_numeric_interval_test_cmp boost::test_exec_monitor)
bcm_test(NAME libs_numeric_interval_test_cmp_exn SOURCES cmp_exn.cpp)
target_link_libraries(libs_numeric_interval_test_cmp_exn boost::test_exec_monitor)
bcm_test(NAME libs_numeric_interval_test_cmp_exp SOURCES cmp_exp.cpp)
target_link_libraries(libs_numeric_interval_test_cmp_exp boost::test_exec_monitor)
bcm_test(NAME libs_numeric_interval_test_cmp_lex SOURCES cmp_lex.cpp)
target_link_libraries(libs_numeric_interval_test_cmp_lex boost::test_exec_monitor)
bcm_test(NAME libs_numeric_interval_test_cmp_set SOURCES cmp_set.cpp)
target_link_libraries(libs_numeric_interval_test_cmp_set boost::test_exec_monitor)
bcm_test(NAME libs_numeric_interval_test_cmp_tribool SOURCES cmp_tribool.cpp)
target_link_libraries(libs_numeric_interval_test_cmp_tribool boost::test_exec_monitor)
bcm_test(NAME libs_numeric_interval_test_test_float SOURCES test_float.cpp)
target_link_libraries(libs_numeric_interval_test_test_float boost::test_exec_monitor)

