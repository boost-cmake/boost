include(BCMTest)

find_package(boost_random)
find_package(boost_functional)
find_package(boost_dynamic_bitset)
find_package(boost_bind)
find_package(boost_assign)
find_package(boost_lambda)

bcm_test_link_libraries(boost_spirit
boost::random
boost::functional
boost::dynamic_bitset
boost::bind
boost::assign
boost::lambda
)

#==============================================================================
#   Copyright (c) 2001-2011 Joel de Guzman
#   Copyright (c) 2001-2012 Hartmut Kaiser
#   Copyright (c)      2011 Bryce Lelbach
#
#   Use, modification and distribution is subject to the Boost Software
#   License, Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt)
#==============================================================================

# bring in rules for testing

###############################################################################

add_library(test_spirit_flags INTERFACE)
target_include_directories(test_spirit_flags INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})
bcm_test_link_libraries(test_spirit_flags)



###############################################################################

###########################################################################


bcm_test(NAME qi_actions SOURCES qi/actions.cpp)
bcm_test(NAME qi_actions2 SOURCES qi/actions2.cpp)
# bcm_test(NAME qi_alternative SOURCES qi/alternative.cpp)
bcm_test(NAME qi_attr SOURCES qi/attr.cpp)
bcm_test(NAME qi_attribute1 SOURCES qi/attribute1.cpp)
bcm_test(NAME qi_attribute2 SOURCES qi/attribute2.cpp)
bcm_test(NAME qi_and_predicate SOURCES qi/and_predicate.cpp)
bcm_test(NAME qi_auto SOURCES qi/auto.cpp)
bcm_test(NAME qi_binary SOURCES qi/binary.cpp)
bcm_test(NAME qi_bool1 SOURCES qi/bool1.cpp)
bcm_test(NAME qi_bool2 SOURCES qi/bool2.cpp)
bcm_test(NAME qi_char1 SOURCES qi/char1.cpp)
bcm_test(NAME qi_char2 SOURCES qi/char2.cpp)
bcm_test(NAME qi_char_class SOURCES qi/char_class.cpp)
bcm_test(NAME qi_debug SOURCES qi/debug.cpp)
bcm_test(NAME qi_difference SOURCES qi/difference.cpp)
bcm_test(NAME qi_encoding SOURCES qi/encoding.cpp)
bcm_test(NAME qi_end SOURCES qi/end.cpp)
bcm_test(NAME qi_eps SOURCES qi/eps.cpp)
bcm_test(NAME qi_expect SOURCES qi/expect.cpp)
bcm_test(NAME qi_grammar SOURCES qi/grammar.cpp)
bcm_test(NAME qi_int1 SOURCES qi/int1.cpp)
bcm_test(NAME qi_int2 SOURCES qi/int2.cpp)
bcm_test(NAME qi_int3 SOURCES qi/int3.cpp)
bcm_test(NAME qi_kleene SOURCES qi/kleene.cpp)
bcm_test(NAME qi_lazy SOURCES qi/lazy.cpp)
bcm_test(NAME qi_lexeme SOURCES qi/lexeme.cpp)
bcm_test(NAME qi_lit1 SOURCES qi/lit1.cpp)
bcm_test(NAME qi_lit2 SOURCES qi/lit2.cpp)
bcm_test(NAME qi_list SOURCES qi/list.cpp)
bcm_test(NAME qi_hold SOURCES qi/hold.cpp)
bcm_test(NAME qi_match_manip1 SOURCES qi/match_manip1.cpp)
bcm_test(NAME qi_match_manip2 SOURCES qi/match_manip2.cpp)
bcm_test(NAME qi_match_manip3 SOURCES qi/match_manip3.cpp)
bcm_test(NAME qi_match_manip_attr SOURCES qi/match_manip_attr.cpp)
bcm_test(NAME qi_matches SOURCES qi/matches.cpp)
bcm_test(NAME qi_no_case SOURCES qi/no_case.cpp)
bcm_test(NAME qi_no_skip SOURCES qi/no_skip.cpp)
bcm_test(NAME qi_not_predicate SOURCES qi/not_predicate.cpp)
bcm_test(NAME qi_optional SOURCES qi/optional.cpp)
bcm_test(NAME qi_parse_attr SOURCES qi/parse_attr.cpp)
bcm_test(NAME qi_pass_container1 SOURCES qi/pass_container1.cpp)
bcm_test(NAME qi_pass_container2 SOURCES qi/pass_container2.cpp)
bcm_test(NAME qi_permutation SOURCES qi/permutation.cpp)
bcm_test(NAME qi_plus SOURCES qi/plus.cpp)
bcm_test(NAME qi_range_run SOURCES qi/range_run.cpp)
bcm_test(NAME qi_raw SOURCES qi/raw.cpp)
bcm_test(NAME qi_real1 SOURCES qi/real1.cpp)
bcm_test(NAME qi_real2 SOURCES qi/real2.cpp)
bcm_test(NAME qi_real3 SOURCES qi/real3.cpp)
bcm_test(NAME qi_real4 SOURCES qi/real4.cpp)
bcm_test(NAME qi_real5 SOURCES qi/real5.cpp)
bcm_test(NAME qi_repeat SOURCES qi/repeat.cpp)
bcm_test(NAME qi_rule1 SOURCES qi/rule1.cpp)
bcm_test(NAME qi_rule2 SOURCES qi/rule2.cpp)
bcm_test(NAME qi_rule3 SOURCES qi/rule3.cpp)
bcm_test(NAME qi_rule4 SOURCES qi/rule4.cpp)
bcm_test(NAME qi_sequence SOURCES qi/sequence.cpp)
bcm_test(NAME qi_sequential_or SOURCES qi/sequential_or.cpp)
bcm_test(NAME qi_skip SOURCES qi/skip.cpp)
bcm_test(NAME qi_stream SOURCES qi/stream.cpp)
bcm_test(NAME qi_symbols1 SOURCES qi/symbols1.cpp)
bcm_test(NAME qi_symbols2 SOURCES qi/symbols2.cpp)
bcm_test(NAME qi_terminal_ex SOURCES qi/terminal_ex.cpp)
bcm_test(NAME qi_tst SOURCES qi/tst.cpp)
bcm_test(NAME qi_uint1 SOURCES qi/uint1.cpp)
bcm_test(NAME qi_uint2 SOURCES qi/uint2.cpp)
bcm_test(NAME qi_uint3 SOURCES qi/uint3.cpp)
bcm_test(NAME qi_uint_radix SOURCES qi/uint_radix.cpp)
bcm_test(NAME qi_utree1 SOURCES qi/utree1.cpp)
bcm_test(NAME qi_utree2 SOURCES qi/utree2.cpp)
bcm_test(NAME qi_utree3 SOURCES qi/utree3.cpp)
bcm_test(NAME qi_utree4 SOURCES qi/utree4.cpp)

###########################################################################


#[ run qi/regression_float_fraction.cpp                      : : : : qi_regression_float_fraction ]
bcm_test(NAME qi_pass_container3 SOURCES qi/pass_container3.cpp COMPILE_ONLY)
bcm_test(NAME qi_regression_attr_with_action SOURCES qi/regression_attr_with_action.cpp COMPILE_ONLY)
bcm_test(NAME qi_regression_container_attribute SOURCES qi/regression_container_attribute.cpp COMPILE_ONLY)
bcm_test(NAME qi_regression_debug_optional SOURCES qi/regression_debug_optional.cpp COMPILE_ONLY)
bcm_test(NAME qi_regression_fusion_proto_spirit SOURCES qi/regression_fusion_proto_spirit.cpp COMPILE_ONLY)
bcm_test(NAME qi_regression_one_element_fusion_sequence SOURCES qi/regression_one_element_fusion_sequence.cpp COMPILE_ONLY)
bcm_test(NAME qi_regression_one_element_sequence_attribute SOURCES qi/regression_one_element_sequence_attribute.cpp COMPILE_ONLY)
bcm_test(NAME qi_regression_adapt_adt SOURCES qi/regression_adapt_adt.cpp)
bcm_test(NAME qi_regression_clear SOURCES qi/regression_clear.cpp)
bcm_test(NAME qi_regression_lazy_repeat SOURCES qi/regression_lazy_repeat.cpp)
bcm_test(NAME qi_regression_numeric_alternatives SOURCES qi/regression_numeric_alternatives.cpp)
bcm_test(NAME qi_regression_reorder SOURCES qi/regression_reorder.cpp)
bcm_test(NAME qi_regression_repeat SOURCES qi/regression_repeat.cpp)
bcm_test(NAME qi_regression_transform_assignment SOURCES qi/regression_transform_assignment.cpp)
bcm_test(NAME qi_regression_binary_action SOURCES qi/regression_binary_action.cpp)
bcm_test(NAME qi_regression_stream_eof SOURCES qi/regression_stream_eof.cpp)

###########################################################################


bcm_test(NAME karma_grammar_fail SOURCES karma/grammar_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME karma_rule_fail SOURCES karma/rule_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME karma_actions SOURCES karma/actions.cpp)
# bcm_test(NAME karma_alternative1 SOURCES karma/alternative1.cpp)
# bcm_test(NAME karma_alternative2 SOURCES karma/alternative2.cpp)
bcm_test(NAME karma_and_predicate SOURCES karma/and_predicate.cpp)
bcm_test(NAME karma_attribute SOURCES karma/attribute.cpp)
bcm_test(NAME karma_auto1 SOURCES karma/auto1.cpp)
bcm_test(NAME karma_auto2 SOURCES karma/auto2.cpp)
bcm_test(NAME karma_auto3 SOURCES karma/auto3.cpp)
bcm_test(NAME karma_binary1 SOURCES karma/binary1.cpp)
bcm_test(NAME karma_binary2 SOURCES karma/binary2.cpp)
bcm_test(NAME karma_binary3 SOURCES karma/binary3.cpp)
bcm_test(NAME karma_bool SOURCES karma/bool.cpp)
bcm_test(NAME karma_buffer SOURCES karma/buffer.cpp)
bcm_test(NAME karma_case_handling1 SOURCES karma/case_handling1.cpp)
bcm_test(NAME karma_case_handling2 SOURCES karma/case_handling2.cpp)
bcm_test(NAME karma_case_handling3 SOURCES karma/case_handling3.cpp)
bcm_test(NAME karma_center_alignment SOURCES karma/center_alignment.cpp)
bcm_test(NAME karma_char1 SOURCES karma/char1.cpp)
bcm_test(NAME karma_char2 SOURCES karma/char2.cpp)
bcm_test(NAME karma_char3 SOURCES karma/char3.cpp)
bcm_test(NAME karma_char_class SOURCES karma/char_class.cpp)
bcm_test(NAME karma_columns SOURCES karma/columns.cpp)
bcm_test(NAME karma_debug SOURCES karma/debug.cpp)
bcm_test(NAME karma_delimiter SOURCES karma/delimiter.cpp)
bcm_test(NAME karma_duplicate SOURCES karma/duplicate.cpp)
bcm_test(NAME karma_encoding SOURCES karma/encoding.cpp)
bcm_test(NAME karma_eol SOURCES karma/eol.cpp)
bcm_test(NAME karma_eps SOURCES karma/eps.cpp)
bcm_test(NAME karma_format_manip SOURCES karma/format_manip.cpp)
bcm_test(NAME karma_format_manip_attr SOURCES karma/format_manip_attr.cpp)
bcm_test(NAME karma_format_pointer_container SOURCES karma/format_pointer_container.cpp)
bcm_test(NAME karma_generate_attr SOURCES karma/generate_attr.cpp)
bcm_test(NAME karma_grammar SOURCES karma/grammar.cpp)
bcm_test(NAME karma_int1 SOURCES karma/int1.cpp)
bcm_test(NAME karma_int2 SOURCES karma/int2.cpp)
bcm_test(NAME karma_int3 SOURCES karma/int3.cpp)
bcm_test(NAME karma_kleene SOURCES karma/kleene.cpp)
bcm_test(NAME karma_lazy SOURCES karma/lazy.cpp)
bcm_test(NAME karma_left_alignment SOURCES karma/left_alignment.cpp)
bcm_test(NAME karma_list SOURCES karma/list.cpp)
bcm_test(NAME karma_lit SOURCES karma/lit.cpp)
bcm_test(NAME karma_maxwidth SOURCES karma/maxwidth.cpp)
bcm_test(NAME karma_not_predicate SOURCES karma/not_predicate.cpp)
bcm_test(NAME karma_omit SOURCES karma/omit.cpp)
bcm_test(NAME karma_optional SOURCES karma/optional.cpp)
bcm_test(NAME karma_pattern1 SOURCES karma/pattern1.cpp)
bcm_test(NAME karma_pattern2 SOURCES karma/pattern2.cpp)
bcm_test(NAME karma_pattern3 SOURCES karma/pattern3.cpp)
bcm_test(NAME karma_pattern4 SOURCES karma/pattern4.cpp)
bcm_test(NAME karma_plus SOURCES karma/plus.cpp)
bcm_test(NAME karma_real1 SOURCES karma/real1.cpp)
bcm_test(NAME karma_real2 SOURCES karma/real2.cpp)
bcm_test(NAME karma_real3 SOURCES karma/real3.cpp)
bcm_test(NAME karma_repeat1 SOURCES karma/repeat1.cpp)
bcm_test(NAME karma_repeat2 SOURCES karma/repeat2.cpp)
bcm_test(NAME karma_right_alignment SOURCES karma/right_alignment.cpp)
bcm_test(NAME karma_sequence1 SOURCES karma/sequence1.cpp)
bcm_test(NAME karma_sequence2 SOURCES karma/sequence2.cpp)
bcm_test(NAME karma_stream SOURCES karma/stream.cpp)
bcm_test(NAME karma_symbols1 SOURCES karma/symbols1.cpp)
bcm_test(NAME karma_symbols2 SOURCES karma/symbols2.cpp)
bcm_test(NAME karma_symbols3 SOURCES karma/symbols3.cpp)
bcm_test(NAME karma_tricky_alignment SOURCES karma/tricky_alignment.cpp)
bcm_test(NAME karma_uint_radix SOURCES karma/uint_radix.cpp)
bcm_test(NAME karma_utree1 SOURCES karma/utree1.cpp)
bcm_test(NAME karma_utree2 SOURCES karma/utree2.cpp)
bcm_test(NAME karma_utree3 SOURCES karma/utree3.cpp)
bcm_test(NAME karma_wstream SOURCES karma/wstream.cpp)

###########################################################################



bcm_test(NAME regression_const_real_policies SOURCES karma/regression_const_real_policies.cpp COMPILE_ONLY)
bcm_test(NAME karma_regression_adapt_adt SOURCES karma/regression_adapt_adt.cpp)
bcm_test(NAME karma_regression_optional_double SOURCES karma/regression_optional_double.cpp)
bcm_test(NAME karma_regression_semantic_action_attribute SOURCES karma/regression_semantic_action_attribute.cpp)
bcm_test(NAME karma_regression_real_scientific SOURCES karma/regression_real_scientific.cpp)
bcm_test(NAME karma_regression_center_alignment SOURCES karma/regression_center_alignment.cpp)
bcm_test(NAME karma_regression_container_variant_sequence SOURCES karma/regression_container_variant_sequence.cpp)
bcm_test(NAME karma_regression_real_0 SOURCES karma/regression_real_0.cpp)
bcm_test(NAME karma_regression_unicode_char SOURCES karma/regression_unicode_char.cpp)
bcm_test(NAME karma_regression_iterator SOURCES karma/regression_iterator.cpp)

###########################################################################


bcm_test(NAME lex_auto_switch_lexerstate SOURCES lex/auto_switch_lexerstate.cpp)
bcm_test(NAME lex_dedent_handling_phoenix SOURCES lex/dedent_handling_phoenix.cpp)
bcm_test(NAME lex_id_type_enum SOURCES lex/id_type_enum.cpp)
bcm_test(NAME lex_lexertl1 SOURCES lex/lexertl1.cpp)
bcm_test(NAME lex_lexertl2 SOURCES lex/lexertl2.cpp)
bcm_test(NAME lex_lexertl3 SOURCES lex/lexertl3.cpp)
bcm_test(NAME lex_lexertl4 SOURCES lex/lexertl4.cpp)
bcm_test(NAME lex_lexertl5 SOURCES lex/lexertl5.cpp)
bcm_test(NAME lex_lexer_state_switcher SOURCES lex/lexer_state_switcher.cpp)
bcm_test(NAME lex_semantic_actions SOURCES lex/semantic_actions.cpp)
bcm_test(NAME lex_set_token_value SOURCES lex/set_token_value.cpp)
bcm_test(NAME lex_set_token_value_phoenix SOURCES lex/set_token_value_phoenix.cpp)
bcm_test(NAME lex_state_switcher SOURCES lex/state_switcher.cpp)
bcm_test(NAME lex_string_token_id SOURCES lex/string_token_id.cpp)
bcm_test(NAME lex_token_iterpair SOURCES lex/token_iterpair.cpp)
bcm_test(NAME lex_token_moretypes SOURCES lex/token_moretypes.cpp)
bcm_test(NAME lex_token_omit SOURCES lex/token_omit.cpp)
bcm_test(NAME lex_token_onetype SOURCES lex/token_onetype.cpp)

###########################################################################

#     [ run lex/regression_matlib_static.cpp : : :
#       <phoenix_v3>on:<dependency>.//lex_regression_matlib_generate-p3
#       <phoenix_v3>off:<dependency>.//lex_regression_matlib_generate-p2
#       : lex_regression_matlib_static ]
#     [ run lex/regression_matlib_switch.cpp : : :
#       <phoenix_v3>on:<dependency>.//lex_regression_matlib_generate_switch-p3
#       <phoenix_v3>off:<dependency>.//lex_regression_matlib_generate_switch-p2
#         : lex_regression_matlib_switch ]

bcm_test(NAME lex_regression_basic_lexer SOURCES lex/regression_basic_lexer.cpp)
bcm_test(NAME lex_regression_matlib_dynamic SOURCES lex/regression_matlib_dynamic.cpp)
bcm_test(NAME lex_regression_matlib_generate SOURCES lex/regression_matlib_generate.cpp)
bcm_test(NAME lex_regression_matlib_generate_switch SOURCES lex/regression_matlib_generate_switch.cpp)
bcm_test(NAME lex_regression_word_count SOURCES lex/regression_word_count.cpp)
bcm_test(NAME lex_regression_syntax_error SOURCES lex/regression_syntax_error.cpp)
bcm_test(NAME lex_regression_wide SOURCES lex/regression_wide.cpp)
bcm_test(NAME lex_regression_file_iterator1 SOURCES lex/regression_file_iterator1.cpp)
bcm_test(NAME lex_regression_file_iterator2 SOURCES lex/regression_file_iterator2.cpp)
bcm_test(NAME lex_regression_file_iterator3 SOURCES lex/regression_file_iterator3.cpp)
bcm_test(NAME lex_regression_file_iterator4 SOURCES lex/regression_file_iterator4.cpp)
bcm_test(NAME regression_static_wide_6253 SOURCES lex/regression_static_wide_6253.cpp)
bcm_test(NAME regression_less_8563 SOURCES lex/regression_less_8563.cpp)

###########################################################################


bcm_test(NAME support_utree SOURCES support/utree.cpp)
bcm_test(NAME support_utree_debug SOURCES support/utree_debug.cpp)

###########################################################################


bcm_test(NAME support_regression_multi_pass_position_iterator SOURCES support/regression_multi_pass_position_iterator.cpp COMPILE_ONLY)
bcm_test(NAME support_regression_multi_pass_functor SOURCES support/regression_multi_pass_functor.cpp COMPILE_ONLY)
bcm_test(NAME support_regression_multi_pass_parse SOURCES support/regression_multi_pass_parse.cpp COMPILE_ONLY)
bcm_test(NAME regression_multi_pass_error_handler SOURCES support/regression_multi_pass_error_handler.cpp)

# use this alias to build Spirit against Phoenix V3


