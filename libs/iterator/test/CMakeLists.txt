include(BCMTest)

find_package(boost_tuple)
find_package(boost_bind)
find_package(boost_test)
find_package(boost_assign)

bcm_test_link_libraries(boost_iterator
boost::tuple
boost::bind
boost::test
boost::assign
)

# Copyright David Abrahams 2003. Distributed under the Boost
# Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# These first two tests will run last, and are expected to fail
# for many less-capable compilers.

bcm_test(NAME interoperable_fail SOURCES interoperable_fail.cpp COMPILE_ONLY WILL_FAIL)
# test uses expected success, so that we catch unrelated
# compilation problems.
bcm_test(NAME is_convertible_fail SOURCES is_convertible_fail.cpp)

bcm_test(NAME zip_iterator_test SOURCES zip_iterator_test.cpp)
bcm_test(NAME zip_iterator_test2_std_tuple SOURCES zip_iterator_test2_std_tuple.cpp)
bcm_test(NAME zip_iterator_test2_fusion_vector SOURCES zip_iterator_test2_fusion_vector.cpp)
bcm_test(NAME zip_iterator_test2_fusion_list SOURCES zip_iterator_test2_fusion_list.cpp)
# See bug report for fusion https://svn.boost.org/trac/boost/ticket/11572
# bcm_test(NAME zip_iterator_test2_fusion_deque SOURCES zip_iterator_test2_fusion_deque.cpp)
bcm_test(NAME zip_iterator_test_fusion SOURCES zip_iterator_test_fusion.cpp)
bcm_test(NAME zip_iterator_test_std_tuple SOURCES zip_iterator_test_std_tuple.cpp)
bcm_test(NAME zip_iterator_test_std_pair SOURCES zip_iterator_test_std_pair.cpp)

# These tests should work for just about everything.
bcm_test(NAME is_lvalue_iterator SOURCES is_lvalue_iterator.cpp COMPILE_ONLY)
bcm_test(NAME is_readable_iterator SOURCES is_readable_iterator.cpp COMPILE_ONLY)
bcm_test(NAME pointee SOURCES pointee.cpp COMPILE_ONLY)

bcm_test(NAME unit_tests SOURCES unit_tests.cpp)
# bcm_test(NAME concept_tests SOURCES concept_tests.cpp)
bcm_test(NAME iterator_adaptor_cc SOURCES iterator_adaptor_cc.cpp)
bcm_test(NAME iterator_adaptor_test SOURCES iterator_adaptor_test.cpp)
bcm_test(NAME iterator_archetype_cc SOURCES iterator_archetype_cc.cpp COMPILE_ONLY)
bcm_test(NAME iter_archetype_default_ctor SOURCES iter_archetype_default_ctor.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME lvalue_concept_fail SOURCES lvalue_concept_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME transform_iterator_test SOURCES transform_iterator_test.cpp)
bcm_test(NAME indirect_iterator_test SOURCES indirect_iterator_test.cpp)
bcm_test(NAME indirect_iter_member_types SOURCES indirect_iter_member_types.cpp COMPILE_ONLY)
bcm_test(NAME filter_iterator_test SOURCES filter_iterator_test.cpp)
bcm_test(NAME iterator_facade SOURCES iterator_facade.cpp)
bcm_test(NAME reverse_iterator_test SOURCES reverse_iterator_test.cpp)
bcm_test(NAME counting_iterator_test SOURCES counting_iterator_test.cpp)
bcm_test(NAME interoperable SOURCES interoperable.cpp)
bcm_test(NAME iterator_traits_test SOURCES iterator_traits_test.cpp)
bcm_test(NAME permutation_iterator_test SOURCES permutation_iterator_test.cpp)
bcm_test(NAME function_input_iterator_test SOURCES function_input_iterator_test.cpp)

bcm_test(NAME generator_iterator_test SOURCES generator_iterator_test.cpp)

bcm_test(NAME minimum_category SOURCES minimum_category.cpp)
bcm_test(NAME minimum_category_compile_fail SOURCES minimum_category_compile_fail.cpp COMPILE_ONLY WILL_FAIL)

