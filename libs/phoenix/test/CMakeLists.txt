include(BCMTest)

find_package(boost_static_assert)
find_package(boost_assign)
find_package(boost_thread)
find_package(boost_typeof)
find_package(boost_spirit)
find_package(boost_test)
find_package(boost_signals2)
find_package(boost_lambda)
find_package(boost_any)
find_package(boost_log)

bcm_test_link_libraries(boost_phoenix
boost::static_assert
boost::assign
boost::thread
boost::typeof
boost::spirit
boost::test
boost::signals2
boost::lambda
boost::any
boost::log
)

#==============================================================================
#    Copyright (c) 2003-2006 Joel de Guzman
#    Copyright (c) 2014-2015 John Fletcher
#
#   Use, modification and distribution is subject to the Boost Software
#   License, Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt)
#==============================================================================

# bring in rules for testing



bcm_test(NAME phoenix_core_custom_terminal SOURCES core/custom_terminal.cpp)
bcm_test(NAME phoenix_core_intel_test SOURCES core/intel_test.cpp)
bcm_test(NAME phoenix_core_primitives_tests SOURCES core/primitives_tests.cpp)

bcm_test(NAME phoenix_stdlib_cmath SOURCES stdlib/cmath.cpp)

bcm_test(NAME phoenix_operator_arithmetic_tests SOURCES operator/arithmetic_tests.cpp)
bcm_test(NAME phoenix_operator_bitwise_tests SOURCES operator/bitwise_tests.cpp)
bcm_test(NAME phoenix_operator_comparison_tests SOURCES operator/comparison_tests.cpp)
bcm_test(NAME phoenix_operator_if_else_tests SOURCES operator/if_else_tests.cpp)
bcm_test(NAME phoenix_operator_io_tests SOURCES operator/io_tests.cpp)
bcm_test(NAME phoenix_operator_logical_tests SOURCES operator/logical_tests.cpp)
bcm_test(NAME phoenix_operator_misc_binary_tests SOURCES operator/misc_binary_tests.cpp)
bcm_test(NAME phoenix_operator_self_tests SOURCES operator/self_tests.cpp)
bcm_test(NAME phoenix_operator_unary_tests SOURCES operator/unary_tests.cpp)
bcm_test(NAME phoenix_operator_member SOURCES operator/member.cpp)

bcm_test(NAME phoenix_object_cast_tests SOURCES object/cast_tests.cpp)
bcm_test(NAME phoenix_object_new_delete_tests SOURCES object/new_delete_tests.cpp)

#    [ run function/lazy_compose_tests.cpp ]
#    [ run function/lazy_fold_tests.cpp ]
#    [ run function/lazy_ptr_tests.cpp ]
#    [ run function/lazy_scan_tests.cpp ]
#    [ run function/lazy_thunk_tests.cpp ]
#    [ run function/function_tests_phx2.cpp ]
bcm_test(NAME phoenix_function_adapt_function SOURCES function/adapt_function.cpp)
bcm_test(NAME phoenix_function_function_tests SOURCES function/function_tests.cpp)
bcm_test(NAME phoenix_function_lazy_argument_tests SOURCES function/lazy_argument_tests.cpp)
bcm_test(NAME phoenix_function_lazy_list_tests SOURCES function/lazy_list_tests.cpp)
bcm_test(NAME phoenix_function_lazy_list2_tests SOURCES function/lazy_list2_tests.cpp)
bcm_test(NAME phoenix_function_lazy_list3_tests SOURCES function/lazy_list3_tests.cpp)
bcm_test(NAME phoenix_function_lazy_make_pair_tests SOURCES function/lazy_make_pair_tests.cpp)
bcm_test(NAME phoenix_function_lazy_templated_struct_tests SOURCES function/lazy_templated_struct_tests.cpp)
bcm_test(NAME phoenix_function_lazy_operator_tests SOURCES function/lazy_operator_tests.cpp)

#    [ run bind/bind_function_object_tests_phx2.cpp ]
bcm_test(NAME phoenix_bind_bind_function_tests SOURCES bind/bind_function_tests.cpp)
bcm_test(NAME phoenix_bind_bind_function_object_tests SOURCES bind/bind_function_object_tests.cpp)
bcm_test(NAME phoenix_bind_bind_member_function_tests SOURCES bind/bind_member_function_tests.cpp)
bcm_test(NAME phoenix_bind_bind_member_variable_tests SOURCES bind/bind_member_variable_tests.cpp)
bcm_test(NAME phoenix_bind_bug5782 SOURCES bind/bug5782.cpp)

bcm_test(NAME phoenix_statement_if_tests SOURCES statement/if_tests.cpp)
bcm_test(NAME phoenix_statement_loops_tests SOURCES statement/loops_tests.cpp)
bcm_test(NAME phoenix_statement_switch_tests SOURCES statement/switch_tests.cpp)
bcm_test(NAME phoenix_statement_exceptions SOURCES statement/exceptions.cpp)
bcm_test(NAME phoenix_statement_bug5715 SOURCES statement/bug5715.cpp)

bcm_test(NAME phoenix_container_container_tests1a SOURCES container/container_tests1a.cpp)
bcm_test(NAME phoenix_container_container_tests1b SOURCES container/container_tests1b.cpp)
bcm_test(NAME phoenix_container_container_tests2a SOURCES container/container_tests2a.cpp)
bcm_test(NAME phoenix_container_container_tests2b SOURCES container/container_tests2b.cpp)
bcm_test(NAME phoenix_container_container_tests3a SOURCES container/container_tests3a.cpp)
bcm_test(NAME phoenix_container_container_tests3b SOURCES container/container_tests3b.cpp)
bcm_test(NAME phoenix_container_container_tests4a SOURCES container/container_tests4a.cpp)
bcm_test(NAME phoenix_container_container_tests4b SOURCES container/container_tests4b.cpp)
bcm_test(NAME phoenix_container_container_tests5a SOURCES container/container_tests5a.cpp)
bcm_test(NAME phoenix_container_container_tests5b SOURCES container/container_tests5b.cpp)
bcm_test(NAME phoenix_container_container_tests6a SOURCES container/container_tests6a.cpp)
bcm_test(NAME phoenix_container_container_tests6b SOURCES container/container_tests6b.cpp)

#    [ run scope/lambda_tests.cpp ]
#    [ run scope/lambda_tests1.cpp ]
#    [ run scope/lambda_tests1b.cpp ]
#    [ run scope/lambda_tests3a1.cpp ]
#    [ run scope/lambda_tests_phx2.cpp ]
#    [ run scope/let_tests_113a.cpp ]
#    [ run scope/let_tests_157a.cpp ]
#    [ run scope/more_let_tests1.cpp ]
#    [ run scope/more_let_tests2a.cpp ]
#    [ run scope/more_let_tests2b.cpp ]
bcm_test(NAME phoenix_scope_lambda_tests1a SOURCES scope/lambda_tests1a.cpp)
bcm_test(NAME phoenix_scope_lambda_tests1b1p SOURCES scope/lambda_tests1b1p.cpp)
bcm_test(NAME phoenix_scope_lambda_tests1b1q SOURCES scope/lambda_tests1b1q.cpp)
bcm_test(NAME phoenix_scope_lambda_tests1b1r SOURCES scope/lambda_tests1b1r.cpp)
bcm_test(NAME phoenix_scope_lambda_tests1b1s SOURCES scope/lambda_tests1b1s.cpp)
bcm_test(NAME phoenix_scope_lambda_tests1b1t SOURCES scope/lambda_tests1b1t.cpp)
bcm_test(NAME phoenix_scope_lambda_tests1b2p SOURCES scope/lambda_tests1b2p.cpp)
bcm_test(NAME phoenix_scope_lambda_tests1b2q SOURCES scope/lambda_tests1b2q.cpp)
bcm_test(NAME phoenix_scope_lambda_tests1b2r SOURCES scope/lambda_tests1b2r.cpp)
bcm_test(NAME phoenix_scope_lambda_tests2 SOURCES scope/lambda_tests2.cpp)
bcm_test(NAME phoenix_scope_lambda_tests2a SOURCES scope/lambda_tests2a.cpp)
bcm_test(NAME phoenix_scope_lambda_tests3 SOURCES scope/lambda_tests3.cpp)
bcm_test(NAME phoenix_scope_lambda_tests3a SOURCES scope/lambda_tests3a.cpp)
bcm_test(NAME phoenix_scope_lambda_tests3b SOURCES scope/lambda_tests3b.cpp)
bcm_test(NAME phoenix_scope_let_tests SOURCES scope/let_tests.cpp)
bcm_test(NAME phoenix_scope_let_tests_113 SOURCES scope/let_tests_113.cpp)
bcm_test(NAME phoenix_scope_let_tests_157 SOURCES scope/let_tests_157.cpp)
bcm_test(NAME phoenix_scope_let_tests_rest SOURCES scope/let_tests_rest.cpp)
bcm_test(NAME phoenix_scope_more_lambda_tests SOURCES scope/more_lambda_tests.cpp)
bcm_test(NAME phoenix_scope_more_let_tests SOURCES scope/more_let_tests.cpp)
bcm_test(NAME phoenix_scope_dynamic_tests SOURCES scope/dynamic_tests.cpp)
bcm_test(NAME phoenix_scope_bug3289 SOURCES scope/bug3289.cpp)
bcm_test(NAME phoenix_scope_bug8298 SOURCES scope/bug8298.cpp)
bcm_test(NAME phoenix_scope_bug8298f SOURCES scope/bug8298f.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME phoenix_scope_bug_000008 SOURCES scope/bug_000008.cpp)

bcm_test(NAME phoenix_algorithm_for_each SOURCES algorithm/for_each.cpp)
bcm_test(NAME phoenix_algorithm_for_each2 SOURCES algorithm/for_each2.cpp)
bcm_test(NAME phoenix_algorithm_for_test SOURCES algorithm/for_test.cpp)
bcm_test(NAME phoenix_algorithm_for_test2 SOURCES algorithm/for_test2.cpp)
bcm_test(NAME phoenix_algorithm_iteration SOURCES algorithm/iteration.cpp)
bcm_test(NAME phoenix_algorithm_transformation1 SOURCES algorithm/transformation1.cpp)
bcm_test(NAME phoenix_algorithm_transformation2 SOURCES algorithm/transformation2.cpp)
bcm_test(NAME phoenix_algorithm_transformation3 SOURCES algorithm/transformation3.cpp)
bcm_test(NAME phoenix_algorithm_transformation4 SOURCES algorithm/transformation4.cpp)
bcm_test(NAME phoenix_algorithm_querying SOURCES algorithm/querying.cpp)
bcm_test(NAME phoenix_algorithm_querying_find SOURCES algorithm/querying_find.cpp)
bcm_test(NAME phoenix_algorithm_querying2 SOURCES algorithm/querying2.cpp)
bcm_test(NAME phoenix_algorithm_querying_find2 SOURCES algorithm/querying_find2.cpp)

#    [ run boost_bind_compatibility/bind_dm1_test.cpp ]
#    [ run boost_bind_compatibility/bind_rv_sp1_test.cpp ]
#    [ run boost_bind_compatibility/bind_rv_sp2_test.cpp ]
#    [ run boost_bind_compatibility/bind_rv_sp3_test.cpp ]
#    [ run boost_bind_compatibility/bind_rv_sp4_test.cpp ]
#    [ run boost_bind_compatibility/bind_rv_sp5_test.cpp ]
#    [ run boost_bind_compatibility/bind_rv_sp6_test.cpp ]
#    [ run boost_bind_compatibility/bind_rv_sp7_test.cpp ]
#    [ run boost_bind_compatibility/bind_void_dm_test.cpp ]
bcm_test(NAME phoenix_boost_bind_compatibility_bind_and_or_test SOURCES boost_bind_compatibility/bind_and_or_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_const_test SOURCES boost_bind_compatibility/bind_const_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_cv_test SOURCES boost_bind_compatibility/bind_cv_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_dm_test SOURCES boost_bind_compatibility/bind_dm_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_dm2_test SOURCES boost_bind_compatibility/bind_dm2_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_dm3_test SOURCES boost_bind_compatibility/bind_dm3_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_eq_test SOURCES boost_bind_compatibility/bind_eq_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_eq2_test SOURCES boost_bind_compatibility/bind_eq2_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_eq3_test SOURCES boost_bind_compatibility/bind_eq3_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_fn2_test SOURCES boost_bind_compatibility/bind_fn2_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_function_test SOURCES boost_bind_compatibility/bind_function_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_interoperation_test SOURCES boost_bind_compatibility/bind_interoperation_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_mf2_test SOURCES boost_bind_compatibility/bind_mf2_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_not_test SOURCES boost_bind_compatibility/bind_not_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_placeholder_test SOURCES boost_bind_compatibility/bind_placeholder_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_ref_test SOURCES boost_bind_compatibility/bind_ref_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_rel_test SOURCES boost_bind_compatibility/bind_rel_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_rvalue_test SOURCES boost_bind_compatibility/bind_rvalue_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_rv_sp_test SOURCES boost_bind_compatibility/bind_rv_sp_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_stateful_test SOURCES boost_bind_compatibility/bind_stateful_test.cpp)
bcm_test(NAME phoenix_boost_bind_compatibility_bind_test SOURCES boost_bind_compatibility/bind_test.cpp)

#   [ run regression/bug5875.cpp ]
bcm_test(NAME phoenix_regression_bug4853 SOURCES regression/bug4853.cpp)
bcm_test(NAME phoenix_regression_bug5626 SOURCES regression/bug5626.cpp)
bcm_test(NAME phoenix_regression_bug5824 SOURCES regression/bug5824.cpp)
bcm_test(NAME phoenix_regression_bug5968 SOURCES regression/bug5968.cpp)
bcm_test(NAME phoenix_regression_bug6040 SOURCES regression/bug6040.cpp)
bcm_test(NAME phoenix_regression_bug6268 SOURCES regression/bug6268.cpp)
bcm_test(NAME phoenix_regression_bug7165 SOURCES regression/bug7165.cpp)
bcm_test(NAME phoenix_regression_bug7166 SOURCES regression/bug7166.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME phoenix_regression_bug7624 SOURCES regression/bug7624.cpp)

#    [ run include/spirit.cpp ]
#    [ run include/spirit_no_specialize.cpp ]
#   [ run include/core/bug7730.cpp ]
bcm_test(NAME phoenix_include_bind SOURCES include/bind.cpp)
bcm_test(NAME phoenix_include_core SOURCES include/core.cpp)
bcm_test(NAME phoenix_include_function SOURCES include/function.cpp)
bcm_test(NAME phoenix_include_fusion SOURCES include/fusion.cpp)
bcm_test(NAME phoenix_include_object SOURCES include/object.cpp)
bcm_test(NAME phoenix_include_operator SOURCES include/operator.cpp)
bcm_test(NAME phoenix_include_scope SOURCES include/scope.cpp)
bcm_test(NAME phoenix_include_statement SOURCES include/statement.cpp)
bcm_test(NAME phoenix_include_stl SOURCES include/stl.cpp)
bcm_test(NAME phoenix_include_version SOURCES include/version.cpp)
bcm_test(NAME phoenix_include_bind_bind_member_function SOURCES include/bind/bind_member_function.cpp)
bcm_test(NAME phoenix_include_bind_bind_member_variable SOURCES include/bind/bind_member_variable.cpp)
bcm_test(NAME phoenix_include_core_actor SOURCES include/core/actor.cpp)
bcm_test(NAME phoenix_include_core_argument SOURCES include/core/argument.cpp)
bcm_test(NAME phoenix_include_core_arity SOURCES include/core/arity.cpp)
bcm_test(NAME phoenix_include_core_debug SOURCES include/core/debug.cpp)
bcm_test(NAME phoenix_include_core_domain SOURCES include/core/domain.cpp)
bcm_test(NAME phoenix_include_core_environment SOURCES include/core/environment.cpp)
bcm_test(NAME phoenix_include_core_expression SOURCES include/core/expression.cpp)
bcm_test(NAME phoenix_include_core_function_equal SOURCES include/core/function_equal.cpp)
bcm_test(NAME phoenix_include_core_is_actor SOURCES include/core/is_actor.cpp)
bcm_test(NAME phoenix_include_core_is_nullary SOURCES include/core/is_nullary.cpp)
bcm_test(NAME phoenix_include_core_limits SOURCES include/core/limits.cpp)
bcm_test(NAME phoenix_include_core_meta_grammar SOURCES include/core/meta_grammar.cpp)
bcm_test(NAME phoenix_include_core_nothing SOURCES include/core/nothing.cpp)
bcm_test(NAME phoenix_include_core_reference SOURCES include/core/reference.cpp)
bcm_test(NAME phoenix_include_core_terminal SOURCES include/core/terminal.cpp)
bcm_test(NAME phoenix_include_core_value SOURCES include/core/value.cpp)
bcm_test(NAME phoenix_include_core_visit_each SOURCES include/core/visit_each.cpp)
bcm_test(NAME phoenix_function_function SOURCES include/function/function.cpp)
bcm_test(NAME phoenix_include_function_lazy_headers SOURCES include/function/lazy_headers.cpp)
bcm_test(NAME phoenix_include_fusion_at SOURCES include/fusion/at.cpp)
bcm_test(NAME phoenix_include_object_const_cast SOURCES include/object/const_cast.cpp)
bcm_test(NAME phoenix_include_object_construct SOURCES include/object/construct.cpp)
bcm_test(NAME phoenix_include_object_delete SOURCES include/object/delete.cpp)
bcm_test(NAME phoenix_include_object_dynamic_cast SOURCES include/object/dynamic_cast.cpp)
bcm_test(NAME phoenix_include_object_new SOURCES include/object/new.cpp)
bcm_test(NAME phoenix_include_object_reinterpret_cast SOURCES include/object/reinterpret_cast.cpp)
bcm_test(NAME phoenix_include_object_static_cast SOURCES include/object/static_cast.cpp)
bcm_test(NAME phoenix_include_operator_arithmetic SOURCES include/operator/arithmetic.cpp)
bcm_test(NAME phoenix_include_operator_bitwise SOURCES include/operator/bitwise.cpp)
bcm_test(NAME phoenix_include_operator_comparison SOURCES include/operator/comparison.cpp)
bcm_test(NAME phoenix_include_operator_if_else SOURCES include/operator/if_else.cpp)
bcm_test(NAME phoenix_include_operator_io SOURCES include/operator/io.cpp)
bcm_test(NAME phoenix_include_operator_logical SOURCES include/operator/logical.cpp)
bcm_test(NAME phoenix_operator_member2 SOURCES include/operator/member.cpp)
bcm_test(NAME phoenix_include_operator_self SOURCES include/operator/self.cpp)
bcm_test(NAME phoenix_include_scope_dynamic SOURCES include/scope/dynamic.cpp)
bcm_test(NAME phoenix_include_scope_lambda SOURCES include/scope/lambda.cpp)
bcm_test(NAME phoenix_include_scope_let SOURCES include/scope/let.cpp)
bcm_test(NAME phoenix_include_scope_local_variable SOURCES include/scope/local_variable.cpp)
bcm_test(NAME phoenix_include_scope_scoped_environment SOURCES include/scope/scoped_environment.cpp)
bcm_test(NAME phoenix_include_scope_this SOURCES include/scope/this.cpp)
bcm_test(NAME phoenix_include_statement_do_while SOURCES include/statement/do_while.cpp)
bcm_test(NAME phoenix_include_statement_for SOURCES include/statement/for.cpp)
bcm_test(NAME phoenix_include_statement_if SOURCES include/statement/if.cpp)
bcm_test(NAME phoenix_include_statement_sequence SOURCES include/statement/sequence.cpp)
bcm_test(NAME phoenix_include_statement_switch SOURCES include/statement/switch.cpp)
bcm_test(NAME phoenix_include_statement_throw SOURCES include/statement/throw.cpp)
bcm_test(NAME phoenix_include_statement_try_catch SOURCES include/statement/try_catch.cpp)
bcm_test(NAME phoenix_include_statement_while SOURCES include/statement/while.cpp)
bcm_test(NAME phoenix_include_stl_algorithm SOURCES include/stl/algorithm.cpp)
bcm_test(NAME phoenix_include_stl_container SOURCES include/stl/container.cpp)
bcm_test(NAME phoenix_container_container SOURCES include/stl/container/container.cpp)
bcm_test(NAME phoenix_include_iteration SOURCES include/stl/algorithm/iteration.cpp)
bcm_test(NAME phoenix_include_querying SOURCES include/stl/algorithm/querying.cpp)
bcm_test(NAME phoenix_include_stl_algorithm_transformation SOURCES include/stl/algorithm/transformation.cpp)
bcm_test(NAME phoenix_include_support_iterate SOURCES include/support/iterate.cpp)
bcm_test(NAME phoenix_include_support_preprocessor_round SOURCES include/support/preprocessor/round.cpp)

