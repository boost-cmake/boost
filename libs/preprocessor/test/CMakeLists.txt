include(BCMTest)


bcm_test_link_libraries(boost_preprocessor
)

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)



# HACK: Workaround broken includes
file(GLOB TEST_HEADERS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.cxx *.h)
foreach(HEADER ${TEST_HEADERS} iteration.cpp)
configure_file(${HEADER} ${CMAKE_CURRENT_BINARY_DIR}/include/libs/preprocessor/test/${HEADER} @ONLY)
endforeach()

add_library(preprocessor_test_settings INTERFACE)
target_include_directories(preprocessor_test_settings INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/include)

bcm_test_link_libraries(preprocessor_test_settings)


bcm_test(NAME preprocessor_arithmetic SOURCES arithmetic.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_array SOURCES array.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_comparison SOURCES comparison.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_control SOURCES control.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_debug SOURCES debug.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_facilities SOURCES facilities.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_iteration SOURCES iteration.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_list SOURCES list.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_logical SOURCES logical.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_punctuation SOURCES punctuation.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_repetition SOURCES repetition.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_selection SOURCES selection.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_seq SOURCES seq.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_slot SOURCES slot.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_tuple SOURCES tuple.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_variadic SOURCES variadic.cpp COMPILE_ONLY)

bcm_test(NAME preprocessor_arithmetic_nvm SOURCES arithmetic.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_arithmetic_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_array_nvm SOURCES array.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_array_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_comparison_nvm SOURCES comparison.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_comparison_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_control_nvm SOURCES control.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_control_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_debug_nvm SOURCES debug.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_debug_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_facilities_nvm SOURCES facilities.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_facilities_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_iteration_nvm SOURCES iteration.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_iteration_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_list_nvm SOURCES list.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_list_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_logical_nvm SOURCES logical.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_logical_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_repetition_nvm SOURCES repetition.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_repetition_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_selection_nvm SOURCES selection.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_selection_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_seq_nvm SOURCES seq.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_seq_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_slot_nvm SOURCES slot.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_slot_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_tuple_nvm SOURCES tuple.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_tuple_nvm PUBLIC BOOST_PP_VARIADICS=0)

bcm_test(NAME preprocessor_arithmetic_c SOURCES arithmetic.c COMPILE_ONLY)
bcm_test(NAME preprocessor_array_c SOURCES array.c COMPILE_ONLY)
bcm_test(NAME preprocessor_comparison_c SOURCES comparison.c COMPILE_ONLY)
bcm_test(NAME preprocessor_control_c SOURCES control.c COMPILE_ONLY)
bcm_test(NAME preprocessor_debug_c SOURCES debug.c COMPILE_ONLY)
bcm_test(NAME preprocessor_facilities_c SOURCES facilities.c COMPILE_ONLY)
bcm_test(NAME preprocessor_list_c SOURCES list.c COMPILE_ONLY)
bcm_test(NAME preprocessor_logical_c SOURCES logical.c COMPILE_ONLY)
bcm_test(NAME preprocessor_punctuation_c SOURCES punctuation.c COMPILE_ONLY)
bcm_test(NAME preprocessor_selection_c SOURCES selection.c COMPILE_ONLY)
bcm_test(NAME preprocessor_seq_c SOURCES seq.c COMPILE_ONLY)
bcm_test(NAME preprocessor_slot_c SOURCES slot.c COMPILE_ONLY)
bcm_test(NAME preprocessor_tuple_c SOURCES tuple.c COMPILE_ONLY)
bcm_test(NAME preprocessor_variadic_c SOURCES variadic.c COMPILE_ONLY)

bcm_test(NAME preprocessor_arithmetic_c_nvm SOURCES arithmetic.c COMPILE_ONLY)
target_compile_definitions(preprocessor_arithmetic_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_array_c_nvm SOURCES array.c COMPILE_ONLY)
target_compile_definitions(preprocessor_array_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_comparison_c_nvm SOURCES comparison.c COMPILE_ONLY)
target_compile_definitions(preprocessor_comparison_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_control_c_nvm SOURCES control.c COMPILE_ONLY)
target_compile_definitions(preprocessor_control_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_debug_c_nvm SOURCES debug.c COMPILE_ONLY)
target_compile_definitions(preprocessor_debug_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_facilities_c_nvm SOURCES facilities.c COMPILE_ONLY)
target_compile_definitions(preprocessor_facilities_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_list_c_nvm SOURCES list.c COMPILE_ONLY)
target_compile_definitions(preprocessor_list_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_logical_c_nvm SOURCES logical.c COMPILE_ONLY)
target_compile_definitions(preprocessor_logical_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_selection_c_nvm SOURCES selection.c COMPILE_ONLY)
target_compile_definitions(preprocessor_selection_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_seq_c_nvm SOURCES seq.c COMPILE_ONLY)
target_compile_definitions(preprocessor_seq_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_slot_c_nvm SOURCES slot.c COMPILE_ONLY)
target_compile_definitions(preprocessor_slot_c_nvm PUBLIC BOOST_PP_VARIADICS=0)
bcm_test(NAME preprocessor_tuple_c_nvm SOURCES tuple.c COMPILE_ONLY)
target_compile_definitions(preprocessor_tuple_c_nvm PUBLIC BOOST_PP_VARIADICS=0)




bcm_test(NAME preprocessor_isempty SOURCES isempty.cpp COMPILE_ONLY)
bcm_test(NAME preprocessor_isempty_variadic_standard_failure SOURCES isempty_variadic_standard_failure.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME preprocessor_isempty_variadic_standard_failure2 SOURCES isempty_variadic_standard_failure2.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME preprocessor_isempty_nvm SOURCES isempty.cpp COMPILE_ONLY)
target_compile_definitions(preprocessor_isempty_nvm PUBLIC BOOST_PP_VARIADICS=0)

bcm_test(NAME preprocessor_isempty_c SOURCES isempty.c COMPILE_ONLY)
bcm_test(NAME preprocessor_isempty_variadic_standard_failure_c SOURCES isempty_variadic_standard_failure.c COMPILE_ONLY WILL_FAIL)
bcm_test(NAME preprocessor_isempty_variadic_standard_failure2_c SOURCES isempty_variadic_standard_failure2.c COMPILE_ONLY WILL_FAIL)

bcm_test(NAME preprocessor_isempty_c_nvm SOURCES isempty.c COMPILE_ONLY)
target_compile_definitions(preprocessor_isempty_c_nvm PUBLIC BOOST_PP_VARIADICS=0)

bcm_test(NAME preprocessor_config_info SOURCES config_info.cpp)

