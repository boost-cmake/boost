include(BCMTest)

find_package(boost_bind)
find_package(boost_chrono)
find_package(boost_interprocess)
find_package(boost_test)

bcm_test_link_libraries(boost_icl
boost::bind
boost::chrono
boost::interprocess
boost::test
)

# (C) Copyright 2008-2011: Joachim Faulhaber
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

# HACK: Workaround broken includes
configure_file(disable_test_warnings.hpp ${CMAKE_CURRENT_BINARY_DIR}/include/libs/icl/test/disable_test_warnings.hpp @ONLY)
configure_file(chrono/utility.hpp ${CMAKE_CURRENT_BINARY_DIR}/include/libs/icl/test/chrono/utility.hpp @ONLY)
add_library(icl_test_include_workaround INTERFACE)
target_include_directories(icl_test_include_workaround INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/include)
bcm_test_link_libraries(icl_test_include_workaround)

# interval
bcm_test(NAME fastest_icl_interval__fastest_icl_interval SOURCES fastest_icl_interval_/fastest_icl_interval.cpp)

# sets
bcm_test(NAME fastest_interval_set__fastest_interval_set SOURCES fastest_interval_set_/fastest_interval_set.cpp)
bcm_test(NAME fastest_interval_set_infix__fastest_interval_set_infix SOURCES fastest_interval_set_infix_/fastest_interval_set_infix.cpp)

bcm_test(NAME fastest_separate_interval_set__fastest_separate_interval_set SOURCES fastest_separate_interval_set_/fastest_separate_interval_set.cpp)
bcm_test(NAME fastest_separate_interval_set_infix__fastest_separate_interval_set_infix SOURCES fastest_separate_interval_set_infix_/fastest_separate_interval_set_infix.cpp)

bcm_test(NAME fastest_split_interval_set__fastest_split_interval_set SOURCES fastest_split_interval_set_/fastest_split_interval_set.cpp)
bcm_test(NAME fastest_split_interval_set_infix__fastest_split_interval_set_infix SOURCES fastest_split_interval_set_infix_/fastest_split_interval_set_infix.cpp)

bcm_test(NAME fastest_interval_set_mixed__fastest_interval_set_mixed SOURCES fastest_interval_set_mixed_/fastest_interval_set_mixed.cpp)

# maps
bcm_test(NAME fastest_interval_map__fastest_interval_map SOURCES fastest_interval_map_/fastest_interval_map.cpp)

bcm_test(NAME fast_stat_interval_map__fast_stat_interval_map_right_open SOURCES fast_stat_interval_map_/fast_stat_interval_map.cpp)
bcm_test(NAME fast_stat_interval_map__fast_stat_interval_map_left_open SOURCES fast_stat_interval_map_/fast_stat_interval_map.cpp)
target_compile_definitions(fast_stat_interval_map__fast_stat_interval_map_left_open PUBLIC BOOST_ICL_CONTINUOUS_STATIC_INTERVAL_DEFAULT=left_open_interval)

bcm_test(NAME fastest_interval_map_infix__fastest_interval_map_infix SOURCES fastest_interval_map_infix_/fastest_interval_map_infix.cpp)
bcm_test(NAME fastest_split_interval_map__fastest_split_interval_map SOURCES fastest_split_interval_map_/fastest_split_interval_map.cpp)
bcm_test(NAME fastest_split_interval_map_infix__fastest_split_interval_map_infix SOURCES fastest_split_interval_map_infix_/fastest_split_interval_map_infix.cpp)
bcm_test(NAME fastest_interval_map_mixed__fastest_interval_map_mixed SOURCES fastest_interval_map_mixed_/fastest_interval_map_mixed.cpp)
bcm_test(NAME fastest_interval_map_mixed2__fastest_interval_map_mixed2 SOURCES fastest_interval_map_mixed2_/fastest_interval_map_mixed2.cpp)
bcm_test(NAME fastest_interval_map_infix_mixed__fastest_interval_map_infix_mixed SOURCES fastest_interval_map_infix_mixed_/fastest_interval_map_infix_mixed.cpp)
bcm_test(NAME fastest_icl_map__fastest_icl_map SOURCES fastest_icl_map_/fastest_icl_map.cpp)

# handcoded tests using laws (not LaBatea) -------------------------------
# Concept Set
bcm_test(NAME fastest_set_interval_set__fastest_set_interval_set SOURCES fastest_set_interval_set_/fastest_set_interval_set.cpp)
bcm_test(NAME fastest_set_icl_set__fastest_set_icl_set SOURCES fastest_set_icl_set_/fastest_set_icl_set.cpp)

# Concept Map
bcm_test(NAME fastest_partial_interval_quantifier__fastest_partial_interval_quantifier SOURCES fastest_partial_interval_quantifier_/fastest_partial_interval_quantifier.cpp)
bcm_test(NAME fastest_total_interval_quantifier__fastest_total_interval_quantifier SOURCES fastest_total_interval_quantifier_/fastest_total_interval_quantifier.cpp)
bcm_test(NAME fastest_partial_icl_quantifier__fastest_partial_icl_quantifier SOURCES fastest_partial_icl_quantifier_/fastest_partial_icl_quantifier.cpp)
bcm_test(NAME fastest_total_icl_quantifier__fastest_total_icl_quantifier SOURCES fastest_total_icl_quantifier_/fastest_total_icl_quantifier.cpp)

# Misc -------------------------------------------------------------------
bcm_test(NAME test_misc__test_misc SOURCES test_misc_/test_misc.cpp)
bcm_test(NAME test_doc_code__test_doc_code SOURCES test_doc_code_/test_doc_code.cpp)
bcm_test(NAME test_type_traits__test_type_traits SOURCES test_type_traits_/test_type_traits.cpp)
# test_combinable is too slow or too large for some compilers
# bcm_test(NAME test_combinable__test_combinable SOURCES test_combinable_/test_combinable.cpp)
bcm_test(NAME test_changing_interval_defaults__test_changing_interval_defaults SOURCES test_changing_interval_defaults_/test_changing_interval_defaults.cpp)

# Bug fixes --------------------------------------------------------------
bcm_test(NAME fix_icl_after_thread__fix_icl_after_thread SOURCES fix_icl_after_thread_/fix_icl_after_thread.cpp)
bcm_test(NAME fix_tickets__fix_tickets SOURCES fix_tickets_/fix_tickets.cpp)

# Check for compiler bugs ------------------------------------------------
# compile-fail-tests
bcm_test(NAME cmp_msvc_value_born_error__cmp_msvc_value_born_error SOURCES cmp_msvc_value_born_error_/cmp_msvc_value_born_error.cpp)
bcm_test(NAME cmp_clang_ttp_passing__cmp_clang_ttp_passing SOURCES cmp_clang_ttp_passing_/cmp_clang_ttp_passing.cpp)
bcm_test(NAME cmp_clang_ttp_passing2__cmp_clang_ttp_passing2 SOURCES cmp_clang_ttp_passing2_/cmp_clang_ttp_passing2.cpp)

# Examples ---------------------------------------------------------------
bcm_test(NAME ex_boost_party__ex_boost_party SOURCES ex_boost_party_/ex_boost_party.cpp)

# Ad hoc -----------------------------------------------------------------
# bcm_test(NAME test_casual__test_casual SOURCES test_casual_/test_casual.cpp)

# ========================================================================
# Chrono -----------------------------------------------------------------
# interval
bcm_test(NAME fastest_icl_interval__fastest_icl_interval_chrono SOURCES fastest_icl_interval_/fastest_icl_interval.cpp)
target_compile_definitions(fastest_icl_interval__fastest_icl_interval_chrono PUBLIC BOOST_ICL_TEST_CHRONO)

# sets
bcm_test(NAME fastest_interval_set__fastest_interval_set_chrono SOURCES fastest_interval_set_/fastest_interval_set.cpp)
target_compile_definitions(fastest_interval_set__fastest_interval_set_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
bcm_test(NAME fastest_interval_set_infix__fastest_interval_set_infix_chrono SOURCES fastest_interval_set_infix_/fastest_interval_set_infix.cpp)
target_compile_definitions(fastest_interval_set_infix__fastest_interval_set_infix_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
bcm_test(NAME fastest_interval_set_mixed__fastest_interval_set_mixed_chrono SOURCES fastest_interval_set_mixed_/fastest_interval_set_mixed.cpp)
target_compile_definitions(fastest_interval_set_mixed__fastest_interval_set_mixed_chrono PUBLIC BOOST_ICL_TEST_CHRONO)

# maps
bcm_test(NAME fastest_interval_map__fastest_interval_map_chrono SOURCES fastest_interval_map_/fastest_interval_map.cpp)
target_compile_definitions(fastest_interval_map__fastest_interval_map_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
bcm_test(NAME fastest_interval_map_infix__fastest_interval_map_infix_chrono SOURCES fastest_interval_map_infix_/fastest_interval_map_infix.cpp)
target_compile_definitions(fastest_interval_map_infix__fastest_interval_map_infix_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
bcm_test(NAME fastest_interval_map_mixed__fastest_interval_map_mixed_chrono SOURCES fastest_interval_map_mixed_/fastest_interval_map_mixed.cpp)
target_compile_definitions(fastest_interval_map_mixed__fastest_interval_map_mixed_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
bcm_test(NAME fastest_interval_map_mixed2__fastest_interval_map_mixed2_chrono SOURCES fastest_interval_map_mixed2_/fastest_interval_map_mixed2.cpp)
target_compile_definitions(fastest_interval_map_mixed2__fastest_interval_map_mixed2_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
bcm_test(NAME fastest_interval_map_infix_mixed__fastest_interval_map_infix_mixed_chrono SOURCES fastest_interval_map_infix_mixed_/fastest_interval_map_infix_mixed.cpp)
target_compile_definitions(fastest_interval_map_infix_mixed__fastest_interval_map_infix_mixed_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
bcm_test(NAME fastest_icl_map__fastest_icl_map_chrono SOURCES fastest_icl_map_/fastest_icl_map.cpp)
target_compile_definitions(fastest_icl_map__fastest_icl_map_chrono PUBLIC BOOST_ICL_TEST_CHRONO)

# handcoded tests using laws (not LaBatea) -------------------------------
# Concept Set
bcm_test(NAME fastest_set_interval_set__fastest_set_interval_set_chrono SOURCES fastest_set_interval_set_/fastest_set_interval_set.cpp)
target_compile_definitions(fastest_set_interval_set__fastest_set_interval_set_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
bcm_test(NAME fastest_set_icl_set__fastest_set_icl_set_chrono SOURCES fastest_set_icl_set_/fastest_set_icl_set.cpp)
target_compile_definitions(fastest_set_icl_set__fastest_set_icl_set_chrono PUBLIC BOOST_ICL_TEST_CHRONO)

# Concept Map
bcm_test(NAME fastest_partial_interval_quantifier__fastest_partial_interval_quantifier_chrono SOURCES fastest_partial_interval_quantifier_/fastest_partial_interval_quantifier.cpp)
target_compile_definitions(fastest_partial_interval_quantifier__fastest_partial_interval_quantifier_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
bcm_test(NAME fastest_total_interval_quantifier__fastest_total_interval_quantifier_chrono SOURCES fastest_total_interval_quantifier_/fastest_total_interval_quantifier.cpp)
target_compile_definitions(fastest_total_interval_quantifier__fastest_total_interval_quantifier_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
bcm_test(NAME fastest_partial_icl_quantifier__fastest_partial_icl_quantifier_chrono SOURCES fastest_partial_icl_quantifier_/fastest_partial_icl_quantifier.cpp)
target_compile_definitions(fastest_partial_icl_quantifier__fastest_partial_icl_quantifier_chrono PUBLIC BOOST_ICL_TEST_CHRONO)
bcm_test(NAME fastest_total_icl_quantifier__fastest_total_icl_quantifier_chrono SOURCES fastest_total_icl_quantifier_/fastest_total_icl_quantifier.cpp)
target_compile_definitions(fastest_total_icl_quantifier__fastest_total_icl_quantifier_chrono PUBLIC BOOST_ICL_TEST_CHRONO)

