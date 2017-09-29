include(BCMTest)

find_package(boost_thread)
find_package(boost_detail)
find_package(boost_timer)
find_package(boost_range)
find_package(boost_array)
find_package(boost_lexical_cast)

bcm_test_link_libraries(boost_regex
boost::thread
boost::detail
boost::timer
boost::range
boost::array
boost::lexical_cast
)

# copyright John Maddock 2003
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt.

# There are unidentified linker problems on these platforms:
#<toolset>gcc-mw:<link>static
#<toolset>gcc-mingw:<link>static

#
# rule for simple regex test programs:
#
# bcm_test(NAME $(name) SOURCES $(sources))

# sources
set(R_SOURCE
regress/basic_tests.cpp
regress/main.cpp
regress/test_alt.cpp
regress/test_anchors.cpp
regress/test_asserts.cpp
regress/test_backrefs.cpp
regress/test_deprecated.cpp
regress/test_emacs.cpp
regress/test_escapes.cpp
regress/test_grep.cpp
regress/test_locale.cpp
regress/test_mfc.cpp
regress/test_non_greedy_repeats.cpp
regress/test_perl_ex.cpp
regress/test_replace.cpp
regress/test_sets.cpp
regress/test_simple_repeats.cpp
regress/test_tricky_cases.cpp
regress/test_icu.cpp
regress/test_unicode.cpp
regress/test_overloads.cpp
regress/test_operators.cpp
)

# add_library(boost_regex_recursive STATIC
#     ../src/c_regex_traits.cpp
#     ../src/cpp_regex_traits.cpp
#     ../src/cregex.cpp
#     ../src/fileiter.cpp
#     ../src/icu.cpp
#     ../src/instances.cpp
#     ../src/posix_api.cpp
#     ../src/regex.cpp
#     ../src/regex_debug.cpp
#     ../src/regex_raw_buffer.cpp
#     ../src/regex_traits_defaults.cpp
#     ../src/static_mutex.cpp
#     ../src/w32_regex_traits.cpp
#     ../src/wc_regex_traits.cpp
#     ../src/wide_posix_api.cpp
#     ../src/winstances.cpp
#     ../src/usinstances.cpp
# )
# target_compile_definitions(boost_regex_recursive PUBLIC BOOST_REGEX_RECURSIVE=1)
# target_link_libraries(boost_regex_recursive boost_regex)
# bcm_mark_as_test(boost_regex_recursive)

bcm_test(NAME regex_regress SOURCES ${R_SOURCE})
bcm_test(NAME regex_regress_threaded SOURCES ${R_SOURCE})
target_compile_definitions(regex_regress_threaded PUBLIC TEST_THREADS)
bcm_test(NAME wide_posix_api_check_c SOURCES c_compiler_checks/wide_posix_api_check.c COMPILE_ONLY)
bcm_test(NAME pathology_bad_expression_test SOURCES pathology/bad_expression_test.cpp)
bcm_test(NAME pathology_recursion_test SOURCES pathology/recursion_test.cpp)
bcm_test(NAME named_subexpressions_named_subexpressions_test SOURCES named_subexpressions/named_subexpressions_test.cpp)
bcm_test(NAME unicode_iterator_test_utf8 SOURCES unicode/unicode_iterator_test.cpp)
target_compile_definitions(unicode_iterator_test_utf8 PUBLIC TEST_UTF8)
bcm_test(NAME unicode_iterator_test_utf16 SOURCES unicode/unicode_iterator_test.cpp)
target_compile_definitions(unicode_iterator_test_utf16 PUBLIC TEST_UTF16)
bcm_test(NAME static_mutex_static_mutex_test SOURCES static_mutex/static_mutex_test.cpp)
bcm_test(NAME object_cache_object_cache_test SOURCES object_cache/object_cache_test.cpp)
# bcm_test(NAME config_info_regex_config_info SOURCES config_info/regex_config_info.cpp)
# bcm_test(NAME regex_dll_config_info SOURCES config_info/regex_config_info.cpp)
bcm_test(NAME test_collate_info SOURCES collate_info/collate_info.cpp)
bcm_test(NAME concepts_concept_check SOURCES concepts/concept_check.cpp COMPILE_ONLY)
bcm_test(NAME concepts_icu_concept_check SOURCES concepts/icu_concept_check.cpp COMPILE_ONLY)
bcm_test(NAME concepts_range_concept_check SOURCES concepts/range_concept_check.cpp COMPILE_ONLY)
bcm_test(NAME concepts_test_bug_11988 SOURCES concepts/test_bug_11988.cpp)
bcm_test(NAME captures_test SOURCES captures/captures_test.cpp)
target_compile_definitions(captures_test PUBLIC BOOST_REGEX_NO_LIB=1 BOOST_REGEX_MATCH_EXTRA=1)
# bcm_test(NAME regex_regress_recursive SOURCES ${R_SOURCE})
# target_compile_definitions(regex_regress_recursive PUBLIC BOOST_REGEX_RECURSIVE=1)
# target_link_libraries(regex_regress_recursive boost_regex_recursive)
# bcm_test(NAME regex_regress_noeh SOURCES ${R_SOURCE})
# set_target_properties(regex_regress_noeh PROPERTIES CXX_EXCEPTIONS off)
# target_compile_definitions(regex_regress_noeh PUBLIC BOOST_NO_EXCEPTIONS=1)

# bcm_test(NAME test_consolidated SOURCES test_consolidated.cpp COMPILE_ONLY)




