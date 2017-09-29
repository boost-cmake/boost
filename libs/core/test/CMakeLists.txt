include(BCMTest)

find_package(boost_static_assert)
find_package(boost_type_traits)

bcm_test_link_libraries(boost_core
boost::static_assert
boost::type_traits
)

include(BCMProperties)

find_package(boost_static_assert)

bcm_test(NAME core_addressof_test SOURCES addressof_test.cpp)
bcm_test(NAME core_addressof_test2 SOURCES addressof_test2.cpp)
bcm_test(NAME core_addressof_np_test SOURCES addressof_np_test.cpp)
bcm_test(NAME core_addressof_fn_test SOURCES addressof_fn_test.cpp)
bcm_test(NAME core_addressof_constexpr_test SOURCES addressof_constexpr_test.cpp COMPILE_ONLY)
# bcm_test(NAME core_addressof_fail_rvalue SOURCES addressof_fail_rvalue.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME core_checked_delete_test SOURCES checked_delete_test.cpp)
bcm_test(NAME core_checked_delete_fail SOURCES checked_delete_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_checked_delete_fail2 SOURCES checked_delete_fail2.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME core_ref_ct_test SOURCES ref_ct_test.cpp COMPILE_ONLY)
bcm_test(NAME core_ref_test SOURCES ref_test.cpp)
bcm_test(NAME core_ref_ref_test SOURCES ref_ref_test.cpp)
bcm_test(NAME core_ref_fn_test SOURCES ref_fn_test.cpp)
bcm_test(NAME core_ref_rv_fail1 SOURCES ref_rv_fail1.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_ref_rv_fail2 SOURCES ref_rv_fail2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_ref_rv_fail3 SOURCES ref_rv_fail3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_ref_rv_fail4 SOURCES ref_rv_fail4.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_ref_rv_fail5 SOURCES ref_rv_fail5.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_ref_implicit_fail SOURCES ref_implicit_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_ref_implicit_fail2 SOURCES ref_implicit_fail2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_ref_cv_test SOURCES ref_cv_test.cpp)

bcm_test(NAME core_eif_constructors SOURCES eif_constructors.cpp)
bcm_test(NAME core_eif_dummy_arg_disambiguation SOURCES eif_dummy_arg_disambiguation.cpp)
bcm_test(NAME core_eif_lazy SOURCES eif_lazy.cpp)
bcm_test(NAME core_eif_lazy_test SOURCES eif_lazy_test.cpp)
bcm_test(NAME core_eif_member_templates SOURCES eif_member_templates.cpp)
bcm_test(NAME core_eif_namespace_disambiguation SOURCES eif_namespace_disambiguation.cpp)
bcm_test(NAME core_eif_no_disambiguation SOURCES eif_no_disambiguation.cpp)
bcm_test(NAME core_eif_partial_specializations SOURCES eif_partial_specializations.cpp)

bcm_test(NAME core_noncopyable_compile_fail SOURCES noncopyable_compile_fail.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME core_explicit_operator_bool SOURCES explicit_operator_bool.cpp)
bcm_test(NAME core_explicit_operator_bool_noexcept SOURCES explicit_operator_bool_noexcept.cpp)
bcm_test(NAME core_explicit_operator_bool_compile_fail_conv_int SOURCES explicit_operator_bool_compile_fail_conv_int.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_explicit_operator_bool_compile_fail_conv_pvoid SOURCES explicit_operator_bool_compile_fail_conv_pvoid.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_explicit_operator_bool_compile_fail_delete SOURCES explicit_operator_bool_compile_fail_delete.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_explicit_operator_bool_compile_fail_shift SOURCES explicit_operator_bool_compile_fail_shift.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME core_ignore_unused_test SOURCES ignore_unused_test.cpp COMPILE_ONLY)
if(MSVC)
    target_compile_options(core_ignore_unused_test PUBLIC /we4100 /we4101)
elseif(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    target_compile_options(core_ignore_unused_test PUBLIC -Wunused-variable -Werror)
    if(CMAKE_CXX_COMPILER_VERSION VERSION_EQUAL "4.8")
        target_compile_options(core_ignore_unused_test PUBLIC -Wunused-local-typedefs)
    endif()
endif()
bcm_test(NAME core_sp_typeinfo_test SOURCES sp_typeinfo_test.cpp)
bcm_test(NAME core_sp_typeinfo_test_no_rtti SOURCES sp_typeinfo_test.cpp)
set_target_properties(core_sp_typeinfo_test_no_rtti PROPERTIES CXX_RTTI Off)

bcm_test(NAME core_visit_each_test SOURCES visit_each_test.cpp)

bcm_test(NAME core_get_pointer_test SOURCES get_pointer_test.cpp)

bcm_test(NAME core_lightweight_test_test SOURCES lightweight_test_test.cpp)
bcm_test(NAME core_lightweight_test_test_no_except SOURCES lightweight_test_test.cpp)
set_target_properties(core_lightweight_test_test_no_except PROPERTIES CXX_EXCEPTIONS Off)

bcm_test(NAME core_lightweight_test_test2 SOURCES lightweight_test_test2.cpp)
bcm_test(NAME core_lightweight_test_all_eq_test SOURCES lightweight_test_all_eq_test.cpp)
bcm_test(NAME core_lightweight_test_all_with_test SOURCES lightweight_test_all_with_test.cpp)
bcm_test(NAME core_lightweight_test_all_with_fail SOURCES lightweight_test_all_with_fail.cpp)
# bcm_test(NAME core_lightweight_test_lt_le_test SOURCES lightweight_test_lt_le_test.cpp)

# bcm_test(NAME core_lightweight_test_eq_nullptr SOURCES lightweight_test_eq_nullptr.cpp)

bcm_test(NAME core_lightweight_test_fail SOURCES lightweight_test_fail.cpp WILL_FAIL)
bcm_test(NAME core_lightweight_test_fail2 SOURCES lightweight_test_fail2.cpp WILL_FAIL)
bcm_test(NAME core_lightweight_test_fail3 SOURCES lightweight_test_fail3.cpp WILL_FAIL)
bcm_test(NAME core_lightweight_test_fail4 SOURCES lightweight_test_fail4.cpp WILL_FAIL)
bcm_test(NAME core_lightweight_test_fail5 SOURCES lightweight_test_fail5.cpp WILL_FAIL)
bcm_test(NAME core_lightweight_test_fail6 SOURCES lightweight_test_fail6.cpp WILL_FAIL)
bcm_test(NAME core_lightweight_test_fail7 SOURCES lightweight_test_fail7.cpp WILL_FAIL)
bcm_test(NAME core_lightweight_test_fail7_no_rtti SOURCES lightweight_test_fail7.cpp WILL_FAIL)
set_target_properties(core_lightweight_test_fail7_no_rtti PROPERTIES CXX_RTTI Off)
bcm_test(NAME core_lightweight_test_fail8 SOURCES lightweight_test_fail8.cpp WILL_FAIL)
bcm_test(NAME core_lightweight_test_fail8_no_rtti SOURCES lightweight_test_fail8.cpp WILL_FAIL)
set_target_properties(core_lightweight_test_fail8_no_rtti PROPERTIES CXX_RTTI Off)
bcm_test(NAME core_lightweight_test_fail9 SOURCES lightweight_test_fail9.cpp WILL_FAIL)
bcm_test(NAME core_lightweight_test_fail10 SOURCES lightweight_test_fail10.cpp WILL_FAIL)
# bcm_test(NAME core_lightweight_test_lt_fail SOURCES lightweight_test_lt_fail.cpp WILL_FAIL)
# bcm_test(NAME core_lightweight_test_le_fail SOURCES lightweight_test_le_fail.cpp WILL_FAIL)

bcm_test(NAME core_is_same_test SOURCES is_same_test.cpp)

bcm_test(NAME core_typeinfo_test SOURCES typeinfo_test.cpp)
bcm_test(NAME core_typeinfo_test_no_rtti SOURCES typeinfo_test.cpp)
set_target_properties(core_typeinfo_test_no_rtti PROPERTIES CXX_RTTI Off)

bcm_test(NAME core_iterator_test SOURCES iterator_test.cpp)
bcm_test(NAME core_detail_iterator_test SOURCES detail_iterator_test.cpp)

bcm_test(NAME core_demangle_test SOURCES demangle_test.cpp)

bcm_test(NAME core_demangled_name_test SOURCES demangled_name_test.cpp)
bcm_test(NAME core_demangled_name_test_no_rtti SOURCES demangled_name_test.cpp)
set_target_properties(core_demangled_name_test_no_rtti PROPERTIES CXX_RTTI Off)

bcm_test(NAME core_scoped_enum SOURCES scoped_enum.cpp)
bcm_test(NAME core_scoped_enum_compile_fail_conv_from_int SOURCES scoped_enum_compile_fail_conv_from_int.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME core_scoped_enum_compile_fail_conv_to_int SOURCES scoped_enum_compile_fail_conv_to_int.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME core_underlying_type SOURCES underlying_type.cpp)

# bcm_test(NAME core_pointer_traits_to_address_test SOURCES pointer_traits_to_address_test.cpp)
# bcm_test(NAME core_pointer_traits_pointer_test SOURCES pointer_traits_pointer_test.cpp)
# bcm_test(NAME core_pointer_traits_element_type_test SOURCES pointer_traits_element_type_test.cpp)
# bcm_test(NAME core_pointer_traits_difference_type_test SOURCES pointer_traits_difference_type_test.cpp)
# bcm_test(NAME core_pointer_traits_rebind_test SOURCES pointer_traits_rebind_test.cpp)
# bcm_test(NAME core_pointer_traits_pointer_to_test SOURCES pointer_traits_pointer_to_test.cpp)

