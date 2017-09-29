include(BCMTest)

find_package(boost_static_assert)
find_package(boost_test)
find_package(boost_lambda)

bcm_test_link_libraries(boost_function
boost::static_assert
boost::test
boost::lambda
)

# Function library

# Copyright Douglas Gregor 2001-2003. Use, modification and
# distribution is subject to the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org/


# bring in rules for testing


bcm_test(NAME lib_function_test SOURCES function_test.cpp)

bcm_test(NAME lib_function_test_no_rtti SOURCES function_test.cpp)
set_target_properties(lib_function_test_no_rtti PROPERTIES CXX_RTTI off)

bcm_test(NAME function_test_function_n_test SOURCES function_n_test.cpp)

bcm_test(NAME function_test_allocator_test SOURCES allocator_test.cpp)

bcm_test(NAME function_test_stateless_test SOURCES stateless_test.cpp)

bcm_test(NAME function_test_lambda_test SOURCES lambda_test.cpp)

bcm_test(NAME function_test_function_test_fail1 SOURCES function_test_fail1.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME function_test_function_test_fail2 SOURCES function_test_fail2.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME function_test_function_30 SOURCES function_30.cpp COMPILE_ONLY)

bcm_test(NAME function_test_function_arith_cxx98 SOURCES function_arith_cxx98.cpp)

bcm_test(NAME function_test_function_arith_portable SOURCES function_arith_portable.cpp)

bcm_test(NAME function_test_sum_avg_cxx98 SOURCES sum_avg_cxx98.cpp)

bcm_test(NAME function_test_sum_avg_portable SOURCES sum_avg_portable.cpp)

bcm_test(NAME function_test_mem_fun_cxx98 SOURCES mem_fun_cxx98.cpp)

bcm_test(NAME function_test_mem_fun_portable SOURCES mem_fun_portable.cpp)

bcm_test(NAME function_test_std_bind_cxx98 SOURCES std_bind_cxx98.cpp)

bcm_test(NAME function_test_std_bind_portable SOURCES std_bind_portable.cpp)

bcm_test(NAME function_test_function_ref_cxx98 SOURCES function_ref_cxx98.cpp)

bcm_test(NAME function_test_function_ref_portable SOURCES function_ref_portable.cpp)

bcm_test(NAME function_test_contains_test SOURCES contains_test.cpp)

bcm_test(NAME function_test_contains2_test SOURCES contains2_test.cpp)

bcm_test(NAME function_test_nothrow_swap SOURCES nothrow_swap.cpp)

bcm_test(NAME function_test_rvalues_test SOURCES rvalues_test.cpp)

bcm_test(NAME function_test_function_typeof_test SOURCES function_typeof_test.cpp COMPILE_ONLY)

bcm_test(NAME function_test_result_arg_types_test SOURCES result_arg_types_test.cpp)


