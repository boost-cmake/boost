include(BCMTest)

find_package(boost_test)

bcm_test_link_libraries(boost_algorithm
boost::test
)

#  Boost algorithm library test suite Jamfile  ----------------------------
#
#  Copyright Marshall Clow 2010-2012. Use, modification and
#  distribution is subject to the Boost Software License, Version
#  1.0. (See accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt)
#
#  See http://www.boost.org for updates, documentation, and revision history.




# Search tests
bcm_test(NAME empty_search_test SOURCES empty_search_test.cpp)
bcm_test(NAME search_test1 SOURCES search_test1.cpp)
bcm_test(NAME search_test2 SOURCES search_test2.cpp)
bcm_test(NAME search_test3 SOURCES search_test3.cpp)
bcm_test(NAME search_test4 SOURCES search_test4.cpp)
bcm_test(NAME search_fail1 SOURCES search_fail1.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME search_fail2 SOURCES search_fail2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME search_fail3 SOURCES search_fail3.cpp COMPILE_ONLY WILL_FAIL)

# Misc tests
bcm_test(NAME clamp_test SOURCES clamp_test.cpp)
bcm_test(NAME power_test SOURCES power_test.cpp)
bcm_test(NAME power_fail1 SOURCES power_fail1.cpp COMPILE_ONLY WILL_FAIL)

# Cxx11 tests
bcm_test(NAME all_of_test SOURCES all_of_test.cpp)
bcm_test(NAME any_of_test SOURCES any_of_test.cpp)
bcm_test(NAME none_of_test SOURCES none_of_test.cpp)
bcm_test(NAME one_of_test SOURCES one_of_test.cpp)

bcm_test(NAME ordered_test SOURCES ordered_test.cpp)
bcm_test(NAME find_if_not_test1 SOURCES find_if_not_test1.cpp)
bcm_test(NAME copy_if_test1 SOURCES copy_if_test1.cpp)
bcm_test(NAME copy_n_test1 SOURCES copy_n_test1.cpp)
bcm_test(NAME iota_test1 SOURCES iota_test1.cpp)

bcm_test(NAME is_permutation_test1 SOURCES is_permutation_test1.cpp)
bcm_test(NAME partition_point_test1 SOURCES partition_point_test1.cpp)
bcm_test(NAME is_partitioned_test1 SOURCES is_partitioned_test1.cpp)
bcm_test(NAME partition_copy_test1 SOURCES partition_copy_test1.cpp)

# Cxx14 tests
bcm_test(NAME equal_test SOURCES equal_test.cpp)
bcm_test(NAME mismatch_test SOURCES mismatch_test.cpp)

# Hex tests
bcm_test(NAME hex_test1 SOURCES hex_test1.cpp)
bcm_test(NAME hex_test2 SOURCES hex_test2.cpp)
bcm_test(NAME hex_test3 SOURCES hex_test3.cpp)
bcm_test(NAME hex_test4 SOURCES hex_test4.cpp)
bcm_test(NAME hex_fail1 SOURCES hex_fail1.cpp COMPILE_ONLY WILL_FAIL)

# Gather tests
bcm_test(NAME gather_test1 SOURCES gather_test1.cpp)
bcm_test(NAME gather_fail1 SOURCES gather_fail1.cpp COMPILE_ONLY WILL_FAIL)

# SortSubrange tests
bcm_test(NAME sort_subrange_test SOURCES sort_subrange_test.cpp)
bcm_test(NAME partition_subrange_test SOURCES partition_subrange_test.cpp)

# Is_palindrome tests
bcm_test(NAME is_palindrome_test SOURCES is_palindrome_test.cpp)


