include(BCMTest)


bcm_test_link_libraries(boost_concept_check
)

# Copyright David Abrahams, Jeremy Siek, Vladimir Prus
# 2006. Distributed under the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# TODO: Disable this broken test for now
# bcm_test(NAME stl_concept_covering SOURCES stl_concept_covering.cpp)
bcm_test(NAME stl_concept_check SOURCES stl_concept_check.cpp)
bcm_test(NAME concept_check_test SOURCES concept_check_test.cpp)
bcm_test(NAME class_concept_check_test SOURCES class_concept_check_test.cpp)
bcm_test(NAME concept_check_fail_expected SOURCES concept_check_fail_expected.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME class_concept_fail_expected SOURCES class_concept_fail_expected.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME where SOURCES where.cpp)
bcm_test(NAME where_fail SOURCES where_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME usage_fail SOURCES usage_fail.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME old_concept_pass SOURCES old_concept_pass.cpp)
bcm_test(NAME function_requires_fail SOURCES function_requires_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME old_concept_function_fail SOURCES old_concept_function_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME old_concept_class_fail SOURCES old_concept_class_fail.cpp COMPILE_ONLY WILL_FAIL)


