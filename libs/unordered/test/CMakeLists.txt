include(BCMTest)

find_package(boost_static_assert)
find_package(boost_concept_check)
find_package(boost_utility)

bcm_test_link_libraries(boost_unordered
boost::static_assert
boost::concept_check
boost::utility
)


# Copyright 2006-2008 Daniel James.
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


# Would be nice to define -Wundef, but I'm getting warnings from
# Boost.Preprocessor on trunk.

#alias framework : /boost/test//boost_unit_test_framework ;


bcm_test(NAME unordered_fwd_set_test SOURCES unordered/fwd_set_test.cpp)
bcm_test(NAME unordered_fwd_map_test SOURCES unordered/fwd_map_test.cpp)
bcm_test(NAME unordered_allocator_traits SOURCES unordered/allocator_traits.cpp)
bcm_test(NAME unordered_minimal_allocator SOURCES unordered/minimal_allocator.cpp)
bcm_test(NAME unordered_compile_set SOURCES unordered/compile_set.cpp)
bcm_test(NAME unordered_compile_map SOURCES unordered/compile_map.cpp)
bcm_test(NAME compile_map_unordered_allocator SOURCES unordered/compile_map.cpp)
target_compile_definitions(compile_map_unordered_allocator PUBLIC BOOST_UNORDERED_USE_ALLOCATOR_TRAITS=0)
bcm_test(NAME unordered_noexcept_tests SOURCES unordered/noexcept_tests.cpp)
# bcm_test(NAME unordered_link_test_1 SOURCES unordered/link_test_1.cpp)
bcm_test(NAME unordered_incomplete_test SOURCES unordered/incomplete_test.cpp)
bcm_test(NAME unordered_simple_tests SOURCES unordered/simple_tests.cpp)
bcm_test(NAME unordered_equivalent_keys_tests SOURCES unordered/equivalent_keys_tests.cpp)
bcm_test(NAME unordered_constructor_tests SOURCES unordered/constructor_tests.cpp)
bcm_test(NAME unordered_copy_tests SOURCES unordered/copy_tests.cpp)
bcm_test(NAME unordered_move_tests SOURCES unordered/move_tests.cpp)
bcm_test(NAME unordered_assign_tests SOURCES unordered/assign_tests.cpp)
bcm_test(NAME unordered_insert_tests SOURCES unordered/insert_tests.cpp)
bcm_test(NAME unordered_insert_stable_tests SOURCES unordered/insert_stable_tests.cpp)
bcm_test(NAME unordered_insert_hint_tests SOURCES unordered/insert_hint_tests.cpp)
bcm_test(NAME unordered_emplace_tests SOURCES unordered/emplace_tests.cpp)
bcm_test(NAME unordered_unnecessary_copy_tests SOURCES unordered/unnecessary_copy_tests.cpp)
bcm_test(NAME unordered_erase_tests SOURCES unordered/erase_tests.cpp)
bcm_test(NAME unordered_erase_equiv_tests SOURCES unordered/erase_equiv_tests.cpp)
bcm_test(NAME unordered_extract_tests SOURCES unordered/extract_tests.cpp)
bcm_test(NAME unordered_node_handle_tests SOURCES unordered/node_handle_tests.cpp)
bcm_test(NAME unordered_merge_tests SOURCES unordered/merge_tests.cpp)
bcm_test(NAME insert_node_type_fail_map SOURCES unordered/insert_node_type_fail.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(insert_node_type_fail_map PUBLIC UNORDERED_TEST_MAP)
bcm_test(NAME insert_node_type_fail_multimap SOURCES unordered/insert_node_type_fail.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(insert_node_type_fail_multimap PUBLIC UNORDERED_TEST_MULTIMAP)
bcm_test(NAME insert_node_type_fail_set SOURCES unordered/insert_node_type_fail.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(insert_node_type_fail_set PUBLIC UNORDERED_TEST_SET)
bcm_test(NAME insert_node_type_fail_multiset SOURCES unordered/insert_node_type_fail.cpp COMPILE_ONLY WILL_FAIL)
target_compile_definitions(insert_node_type_fail_multiset PUBLIC UNORDERED_TEST_MULTISET)
bcm_test(NAME unordered_find_tests SOURCES unordered/find_tests.cpp)
bcm_test(NAME unordered_at_tests SOURCES unordered/at_tests.cpp)
bcm_test(NAME unordered_bucket_tests SOURCES unordered/bucket_tests.cpp)
bcm_test(NAME unordered_load_factor_tests SOURCES unordered/load_factor_tests.cpp)
bcm_test(NAME unordered_rehash_tests SOURCES unordered/rehash_tests.cpp)
bcm_test(NAME unordered_equality_tests SOURCES unordered/equality_tests.cpp)
bcm_test(NAME unordered_swap_tests SOURCES unordered/swap_tests.cpp)
bcm_test(NAME bmove_compile_set SOURCES unordered/compile_set.cpp)
target_compile_definitions(bmove_compile_set PUBLIC BOOST_UNORDERED_USE_MOVE)
bcm_test(NAME bmove_compile_map SOURCES unordered/compile_map.cpp)
target_compile_definitions(bmove_compile_map PUBLIC BOOST_UNORDERED_USE_MOVE)
bcm_test(NAME bmove_copy SOURCES unordered/copy_tests.cpp)
target_compile_definitions(bmove_copy PUBLIC BOOST_UNORDERED_USE_MOVE)
bcm_test(NAME bmove_move SOURCES unordered/move_tests.cpp)
target_compile_definitions(bmove_move PUBLIC BOOST_UNORDERED_USE_MOVE)
bcm_test(NAME bmove_assign SOURCES unordered/assign_tests.cpp)
target_compile_definitions(bmove_assign PUBLIC BOOST_UNORDERED_USE_MOVE)

bcm_test(NAME exception_constructor_exception_tests SOURCES exception/constructor_exception_tests.cpp)
bcm_test(NAME exception_copy_exception_tests SOURCES exception/copy_exception_tests.cpp)
bcm_test(NAME exception_assign_exception_tests SOURCES exception/assign_exception_tests.cpp)
bcm_test(NAME exception_move_assign_exception_tests SOURCES exception/move_assign_exception_tests.cpp)
bcm_test(NAME exception_insert_exception_tests SOURCES exception/insert_exception_tests.cpp)
bcm_test(NAME exception_erase_exception_tests SOURCES exception/erase_exception_tests.cpp)
bcm_test(NAME exception_rehash_exception_tests SOURCES exception/rehash_exception_tests.cpp)
bcm_test(NAME exception_swap_exception_tests SOURCES exception/swap_exception_tests.cpp)
target_compile_definitions(exception_swap_exception_tests PUBLIC BOOST_UNORDERED_SWAP_METHOD=2)

