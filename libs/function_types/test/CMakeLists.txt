include(BCMTest)


bcm_test_link_libraries(boost_function_types
)


# (C) Copyright Tobias Schwinger
#
# Use, modification and distribution are subject to the Boost Software License,
# Version 1.0. (See http://www.boost.org/LICENSE_1_0.txt).

#-------------------------------------------------------------------------------

find_package(boost_mpl)
find_package(boost_timer)
find_package(boost_tokenizer)
find_package(boost_lexical_cast)
find_package(boost_container)

bcm_test_link_libraries(boost::mpl boost::timer boost::tokenizer boost::lexical_cast boost::container)


bcm_test(NAME classification_is_function SOURCES classification/is_function.cpp COMPILE_ONLY)
bcm_test(NAME classification_is_function_pointer SOURCES classification/is_function_pointer.cpp COMPILE_ONLY)
bcm_test(NAME classification_is_function_reference SOURCES classification/is_function_reference.cpp COMPILE_ONLY)
bcm_test(NAME classification_is_member_function_pointer SOURCES classification/is_member_function_pointer.cpp COMPILE_ONLY)
bcm_test(NAME classification_is_member_object_pointer SOURCES classification/is_member_object_pointer.cpp COMPILE_ONLY)
bcm_test(NAME classification_is_callable_builtin SOURCES classification/is_callable_builtin.cpp COMPILE_ONLY)
bcm_test(NAME classification_is_nonmember_callable_builtin SOURCES classification/is_nonmember_callable_builtin.cpp COMPILE_ONLY)
bcm_test(NAME classification_is_member_pointer SOURCES classification/is_member_pointer.cpp COMPILE_ONLY)

bcm_test(NAME classification_is_cv_mem_func_ptr SOURCES classification/is_cv_mem_func_ptr.cpp COMPILE_ONLY)
bcm_test(NAME classification_is_variadic SOURCES classification/is_variadic.cpp COMPILE_ONLY)
bcm_test(NAME classification_is_cv_pointer SOURCES classification/is_cv_pointer.cpp COMPILE_ONLY)
# bcm_test(NAME classification_is_cv_function SOURCES classification/is_cv_function.cpp COMPILE_ONLY)


bcm_test(NAME decomposition_components SOURCES decomposition/components.cpp COMPILE_ONLY)
bcm_test(NAME decomposition_result_type SOURCES decomposition/result_type.cpp COMPILE_ONLY)
bcm_test(NAME decomposition_function_arity SOURCES decomposition/function_arity.cpp COMPILE_ONLY)
bcm_test(NAME decomposition_parameter_types SOURCES decomposition/parameter_types.cpp COMPILE_ONLY)

bcm_test(NAME decomposition_components_seq SOURCES decomposition/components_seq.cpp COMPILE_ONLY)
bcm_test(NAME decomposition_class_type_transform SOURCES decomposition/class_type_transform.cpp COMPILE_ONLY)

bcm_test(NAME decomposition_result_type_fail SOURCES decomposition/result_type_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME decomposition_parameter_types_fail SOURCES decomposition/parameter_types_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME decomposition_function_arity_fail SOURCES decomposition/function_arity_fail.cpp COMPILE_ONLY WILL_FAIL)


bcm_test(NAME synthesis_function_type SOURCES synthesis/function_type.cpp COMPILE_ONLY)
bcm_test(NAME synthesis_function_pointer SOURCES synthesis/function_pointer.cpp COMPILE_ONLY)
bcm_test(NAME synthesis_function_reference SOURCES synthesis/function_reference.cpp COMPILE_ONLY)
bcm_test(NAME synthesis_member_function_pointer SOURCES synthesis/member_function_pointer.cpp COMPILE_ONLY)
bcm_test(NAME synthesis_member_object_pointer SOURCES synthesis/member_object_pointer.cpp COMPILE_ONLY)

bcm_test(NAME synthesis_transformation SOURCES synthesis/transformation.cpp COMPILE_ONLY)
bcm_test(NAME synthesis_mem_func_ptr_cv1 SOURCES synthesis/mem_func_ptr_cv1.cpp COMPILE_ONLY)
bcm_test(NAME synthesis_mem_func_ptr_cv2 SOURCES synthesis/mem_func_ptr_cv2.cpp COMPILE_ONLY)
bcm_test(NAME synthesis_mem_func_ptr_cv_ptr_to_this SOURCES synthesis/mem_func_ptr_cv_ptr_to_this.cpp COMPILE_ONLY)
bcm_test(NAME synthesis_variadic_function_synthesis SOURCES synthesis/variadic_function_synthesis.cpp COMPILE_ONLY)
# bcm_test(NAME synthesis_cv_function_synthesis SOURCES synthesis/cv_function_synthesis.cpp COMPILE_ONLY)


bcm_test(NAME reconfiguration_preprocessing_mode SOURCES reconfiguration/preprocessing_mode.cpp COMPILE_ONLY)
bcm_test(NAME reconfiguration_partial_arity_preprocessing SOURCES reconfiguration/partial_arity_preprocessing.cpp COMPILE_ONLY)
bcm_test(NAME reconfiguration_cc_preprocessing SOURCES reconfiguration/cc_preprocessing.cpp COMPILE_ONLY)

if(WIN32)
bcm_test(NAME custom_ccs_nonmember_ccs SOURCES custom_ccs/nonmember_ccs.cpp COMPILE_ONLY)
bcm_test(NAME custom_ccs_nonmember_ccs_exact SOURCES custom_ccs/nonmember_ccs_exact.cpp COMPILE_ONLY)
bcm_test(NAME custom_ccs_member_ccs SOURCES custom_ccs/member_ccs.cpp COMPILE_ONLY)
bcm_test(NAME custom_ccs_member_ccs_exact SOURCES custom_ccs/member_ccs_exact.cpp COMPILE_ONLY)
endif()

bcm_test(NAME example_interpreter_example SOURCES ../example/interpreter_example.cpp COMPILE_ONLY)
bcm_test(NAME example_result_of_example SOURCES ../example/result_of_example.cpp COMPILE_ONLY)
bcm_test(NAME example_interface_example SOURCES ../example/interface_example.cpp COMPILE_ONLY)
bcm_test(NAME example_fast_mem_fn_example SOURCES ../example/fast_mem_fn_example.cpp COMPILE_ONLY)
# needed for Boost.PP file iteration with some compilers
target_include_directories(example_fast_mem_fn_example PUBLIC ../example)
bcm_test(NAME example_macro_type_args_example SOURCES ../example/macro_type_args_example.cpp COMPILE_ONLY)



