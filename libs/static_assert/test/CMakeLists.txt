include(BCMTest)


bcm_test_link_libraries(boost_static_assert
)

# copyright John Maddock 2003
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0. (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in the rules for testing

#   [ run static_assert_example_1.cpp ]

bcm_test_link_libraries(boost_static_assert boost::type_traits)

bcm_test(NAME static_assert_test SOURCES ../static_assert_test.cpp)
bcm_test(NAME static_assert_example_2 SOURCES ../static_assert_example_2.cpp)
bcm_test(NAME static_assert_example_3 SOURCES ../static_assert_example_3.cpp)
bcm_test(NAME static_assert_test_fail_1 SOURCES ../static_assert_test_fail_1.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME static_assert_test_fail_2 SOURCES ../static_assert_test_fail_2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME static_assert_test_fail_3 SOURCES ../static_assert_test_fail_3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME static_assert_test_fail_4 SOURCES ../static_assert_test_fail_4.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME static_assert_test_fail_5 SOURCES ../static_assert_test_fail_5.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME static_assert_test_fail_6 SOURCES ../static_assert_test_fail_6.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME static_assert_test_fail_7 SOURCES ../static_assert_test_fail_7.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME static_assert_test_fail_8 SOURCES ../static_assert_test_fail_8.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME static_assert_test_fail_9 SOURCES ../static_assert_test_fail_9.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME static_assert_test_fail_10 SOURCES ../static_assert_test_fail_10.cpp COMPILE_ONLY WILL_FAIL)

