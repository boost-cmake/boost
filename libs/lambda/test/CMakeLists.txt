include(BCMTest)

find_package(boost_function)
find_package(boost_smart_ptr)
find_package(boost_test)
find_package(boost_any)

bcm_test_link_libraries(boost_lambda
boost::function
boost::smart_ptr
boost::test
boost::any
)

# Lambda library

# Copyright (C) 2001-2003 Jaakko Jarvi

# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org/



bcm_test(NAME lambda-algorithm_test SOURCES algorithm_test.cpp)
bcm_test(NAME lambda-bind_tests_simple SOURCES bind_tests_simple.cpp)
bcm_test(NAME lambda-bind_tests_advanced SOURCES bind_tests_advanced.cpp)
bcm_test(NAME lambda-bind_tests_simple_f_refs SOURCES bind_tests_simple_f_refs.cpp)
bcm_test(NAME lambda-bll_and_function SOURCES bll_and_function.cpp)
bcm_test(NAME lambda-lambda_cast_test SOURCES cast_test.cpp)
bcm_test(NAME lambda-constructor_tests SOURCES constructor_tests.cpp)
bcm_test(NAME lambda-control_structures SOURCES control_structures.cpp)
bcm_test(NAME lambda-exception_test SOURCES exception_test.cpp)
bcm_test(NAME lambda-extending_rt_traits SOURCES extending_rt_traits.cpp)
bcm_test(NAME lambda-is_instance_of_test SOURCES is_instance_of_test.cpp)
bcm_test(NAME lambda-member_pointer_test SOURCES member_pointer_test.cpp)
bcm_test(NAME lambda-operator_tests_simple SOURCES operator_tests_simple.cpp)
bcm_test(NAME lambda-phoenix_control_structures SOURCES phoenix_control_structures.cpp)
bcm_test(NAME lambda-switch_construct SOURCES switch_construct.cpp)
bcm_test(NAME lambda-result_of_tests SOURCES result_of_tests.cpp)
bcm_test(NAME lambda-ret_test SOURCES ret_test.cpp)

