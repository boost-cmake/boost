include(BCMTest)

find_package(boost_tuple)
find_package(boost_concept_check)
find_package(boost_test)
find_package(boost_utility)

bcm_test_link_libraries(boost_type_erasure
boost::tuple
boost::concept_check
boost::test
boost::utility
)

# Boost.TypeErasure library
#
# Copyright 2011 Steven Watanabe
#
# Distributed under the Boost Software License version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME test_binding SOURCES test_binding.cpp)
bcm_test(NAME test_increment SOURCES test_increment.cpp)
bcm_test(NAME test_add SOURCES test_add.cpp)
bcm_test(NAME test_add_assign SOURCES test_add_assign.cpp)
bcm_test(NAME test_callable SOURCES test_callable.cpp)
bcm_test(NAME test_reference SOURCES test_reference.cpp)
bcm_test(NAME test_construct SOURCES test_construct.cpp)
bcm_test(NAME test_relaxed SOURCES test_relaxed.cpp)
bcm_test(NAME test_assign SOURCES test_assign.cpp)
bcm_test(NAME test_construct_ref SOURCES test_construct_ref.cpp)
bcm_test(NAME test_construct_cref SOURCES test_construct_cref.cpp)
bcm_test(NAME test_any_cast SOURCES test_any_cast.cpp)
bcm_test(NAME test_binding_of SOURCES test_binding_of.cpp)
bcm_test(NAME test_typeid_of SOURCES test_typeid_of.cpp)
bcm_test(NAME test_nested SOURCES test_nested.cpp)
bcm_test(NAME test_less SOURCES test_less.cpp)
bcm_test(NAME test_equal SOURCES test_equal.cpp)
bcm_test(NAME test_negate SOURCES test_negate.cpp)
bcm_test(NAME test_dereference SOURCES test_dereference.cpp)
bcm_test(NAME test_subscript SOURCES test_subscript.cpp)
bcm_test(NAME test_forward_iterator SOURCES test_forward_iterator.cpp)
bcm_test(NAME test_tuple SOURCES test_tuple.cpp)
bcm_test(NAME test_stream SOURCES test_stream.cpp)
bcm_test(NAME test_deduced SOURCES test_deduced.cpp)
bcm_test(NAME test_same_type SOURCES test_same_type.cpp)
bcm_test(NAME test_member SOURCES test_member.cpp)
bcm_test(NAME test_null SOURCES test_null.cpp)
bcm_test(NAME test_free SOURCES test_free.cpp)
bcm_test(NAME test_is_empty SOURCES test_is_empty.cpp)
bcm_test(NAME test_dynamic_any_cast SOURCES test_dynamic_any_cast.cpp)

bcm_test(NAME test_param SOURCES test_param.cpp COMPILE_ONLY)
bcm_test(NAME test_is_subconcept SOURCES test_is_subconcept.cpp COMPILE_ONLY)

bcm_test(NAME fail_default_construct SOURCES fail_default_construct.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_construct_mismatch SOURCES fail_construct_mismatch.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_construct_mismatch_ref SOURCES fail_construct_mismatch_ref.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_construct_mismatch_cref SOURCES fail_construct_mismatch_cref.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_binding_convert_no_mapping SOURCES fail_binding_convert_no_mapping.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_increment_discard_const SOURCES fail_increment_discard_const.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME fail_ref_assign SOURCES fail_ref_assign.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_cref_assign SOURCES fail_cref_assign.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME fail_ref_discard_const SOURCES fail_ref_discard_const.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_ref_discard_const_convert SOURCES fail_ref_discard_const_convert.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_ref_discard_const_convert_ref SOURCES fail_ref_discard_const_convert_ref.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_ref_discard_const_convert_cref SOURCES fail_ref_discard_const_convert_cref.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_ref_discard_const_init SOURCES fail_ref_discard_const_init.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME fail_any_cast_discard_const1 SOURCES fail_any_cast_discard_const1.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_any_cast_discard_const2 SOURCES fail_any_cast_discard_const2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_any_cast_discard_const3 SOURCES fail_any_cast_discard_const3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_any_cast_discard_const4 SOURCES fail_any_cast_discard_const4.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_any_cast_discard_const5 SOURCES fail_any_cast_discard_const5.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_any_cast_discard_const6 SOURCES fail_any_cast_discard_const6.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_any_cast_pointer_to_ref SOURCES fail_any_cast_pointer_to_ref.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_any_cast_pointer_to_val SOURCES fail_any_cast_pointer_to_val.cpp COMPILE_ONLY WILL_FAIL)

