include(BCMTest)

find_package(boost_test)

bcm_test_link_libraries(boost_xpressive
boost::test
)

# (C) Copyright 2004: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

# Turn off debug symbols on MSVC to bring down the size of object files
#        <toolset>gcc:<cxxflags>-W
#        <toolset>gcc:<cxxflags>-Wall
#        <toolset>msvc:<cxxflags>-W4

#         [ compile test_typeof.cpp ]
#         [ compile test_typeof2.cpp ]
bcm_test(NAME regress SOURCES regress.cpp)
bcm_test(NAME regress_u SOURCES regress_u.cpp)
bcm_test(NAME c_traits SOURCES c_traits.cpp)
bcm_test(NAME c_traits_u SOURCES c_traits_u.cpp)
bcm_test(NAME test1 SOURCES test1.cpp)
bcm_test(NAME test2 SOURCES test2.cpp)
bcm_test(NAME test3 SOURCES test3.cpp)
bcm_test(NAME test4 SOURCES test4.cpp)
bcm_test(NAME test5 SOURCES test5.cpp)
bcm_test(NAME test6 SOURCES test6.cpp)
bcm_test(NAME test7 SOURCES test7.cpp)
bcm_test(NAME test8 SOURCES test8.cpp)
bcm_test(NAME test9 SOURCES test9.cpp)
bcm_test(NAME test10 SOURCES test10.cpp)
bcm_test(NAME test11 SOURCES test11.cpp)
bcm_test(NAME test1u SOURCES test1u.cpp)
bcm_test(NAME test2u SOURCES test2u.cpp)
bcm_test(NAME test3u SOURCES test3u.cpp)
bcm_test(NAME test4u SOURCES test4u.cpp)
bcm_test(NAME test5u SOURCES test5u.cpp)
bcm_test(NAME test6u SOURCES test6u.cpp)
bcm_test(NAME test7u SOURCES test7u.cpp)
bcm_test(NAME test8u SOURCES test8u.cpp)
bcm_test(NAME test9u SOURCES test9u.cpp)
bcm_test(NAME test10u SOURCES test10u.cpp)
bcm_test(NAME test11u SOURCES test11u.cpp)
bcm_test(NAME misc1 SOURCES misc1.cpp)
bcm_test(NAME misc2 SOURCES misc2.cpp)
bcm_test(NAME test_format SOURCES test_format.cpp)
bcm_test(NAME test_cycles SOURCES test_cycles.cpp)
bcm_test(NAME test_non_char SOURCES test_non_char.cpp)
bcm_test(NAME test_static SOURCES test_static.cpp)
bcm_test(NAME test_actions SOURCES test_actions.cpp)
bcm_test(NAME test_assert SOURCES test_assert.cpp)
bcm_test(NAME test_assert_with_placeholder SOURCES test_assert_with_placeholder.cpp)
bcm_test(NAME test_symbols SOURCES test_symbols.cpp)
bcm_test(NAME test_dynamic SOURCES test_dynamic.cpp)
bcm_test(NAME test_dynamic_grammar SOURCES test_dynamic_grammar.cpp)
bcm_test(NAME test_skip SOURCES test_skip.cpp)
bcm_test(NAME multiple_defs SOURCES multiple_defs1.cpp COMPILE_ONLY)
bcm_test(NAME test_basic_regex SOURCES test_basic_regex.cpp COMPILE_ONLY)
bcm_test(NAME test_match_results SOURCES test_match_results.cpp COMPILE_ONLY)
bcm_test(NAME test_regex_algorithms SOURCES test_regex_algorithms.cpp COMPILE_ONLY)
bcm_test(NAME test_regex_compiler SOURCES test_regex_compiler.cpp COMPILE_ONLY)
bcm_test(NAME test_regex_constants SOURCES test_regex_constants.cpp COMPILE_ONLY)
bcm_test(NAME test_regex_error SOURCES test_regex_error.cpp COMPILE_ONLY)
bcm_test(NAME test_regex_iterator SOURCES test_regex_iterator.cpp COMPILE_ONLY)
bcm_test(NAME test_regex_primitives SOURCES test_regex_primitives.cpp COMPILE_ONLY)
bcm_test(NAME test_regex_token_iterator SOURCES test_regex_token_iterator.cpp COMPILE_ONLY)
bcm_test(NAME test_regex_traits SOURCES test_regex_traits.cpp COMPILE_ONLY)
bcm_test(NAME test_sub_match SOURCES test_sub_match.cpp COMPILE_ONLY)


