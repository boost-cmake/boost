include(BCMTest)

find_package(boost_range)
find_package(boost_test)
find_package(boost_assign)

bcm_test_link_libraries(boost_bimap
boost::range
boost::test
boost::assign
)

# Boost.Bimap
#
# Copyright (c) 2006-2007 Matias Capeletto
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

# HACK: Workaround broken includes
configure_file(test_bimap.hpp ${CMAKE_CURRENT_BINARY_DIR}/include/libs/bimap/test/test_bimap.hpp @ONLY)

find_package(boost_xpressive)

bcm_test(NAME test_tagged SOURCES test_tagged.cpp)


bcm_test(NAME test_structured_pair SOURCES test_structured_pair.cpp)
bcm_test(NAME test_mutant SOURCES test_mutant.cpp)
bcm_test(NAME test_mutant_relation SOURCES test_mutant_relation.cpp)



bcm_test(NAME test_bimap_set_of SOURCES test_bimap_set_of.cpp)
bcm_test(NAME test_bimap_multiset_of SOURCES test_bimap_multiset_of.cpp)
bcm_test(NAME test_bimap_unordered_set_of SOURCES test_bimap_unordered_set_of.cpp)
bcm_test(NAME test_bimap_unordered_multiset_of SOURCES test_bimap_unordered_multiset_of.cpp)
bcm_test(NAME test_bimap_list_of SOURCES test_bimap_list_of.cpp)
bcm_test(NAME test_bimap_vector_of SOURCES test_bimap_vector_of.cpp)

bcm_test(NAME test_bimap_ordered SOURCES test_bimap_ordered.cpp)
bcm_test(NAME test_bimap_unordered SOURCES test_bimap_unordered.cpp)
bcm_test(NAME test_bimap_sequenced SOURCES test_bimap_sequenced.cpp)
foreach(TARGET test_bimap_ordered test_bimap_unordered test_bimap_sequenced)
    target_include_directories(${TARGET} PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/include)
endforeach()

bcm_test(NAME test_bimap_unconstrained SOURCES test_bimap_unconstrained.cpp)
bcm_test(NAME test_bimap_assign SOURCES test_bimap_assign.cpp)
bcm_test(NAME test_bimap_property_map SOURCES test_bimap_property_map.cpp)
bcm_test(NAME test_bimap_modify SOURCES test_bimap_modify.cpp)
bcm_test(NAME test_bimap_range SOURCES test_bimap_range.cpp)
bcm_test(NAME test_bimap_operator_bracket SOURCES test_bimap_operator_bracket.cpp)
bcm_test(NAME test_bimap_lambda SOURCES test_bimap_lambda.cpp)
bcm_test(NAME test_bimap_mutable SOURCES test_bimap_mutable.cpp)
bcm_test(NAME test_bimap_extra SOURCES test_bimap_extra.cpp)
bcm_test(NAME test_bimap_convenience_header SOURCES test_bimap_convenience_header.cpp)
bcm_test(NAME test_bimap_project SOURCES test_bimap_project.cpp)
bcm_test(NAME test_bimap_serialization SOURCES test_bimap_serialization.cpp)
bcm_test(NAME test_bimap_info SOURCES test_bimap_info.cpp)


bcm_test(NAME compile_fail_test_bimap_mutable_1 SOURCES compile_fail/test_bimap_mutable_1.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME compile_fail_test_bimap_mutable_2 SOURCES compile_fail/test_bimap_mutable_2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME compile_fail_test_bimap_mutable_3 SOURCES compile_fail/test_bimap_mutable_3.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME compile_fail_test_bimap_info_1 SOURCES compile_fail/test_bimap_info_1.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME compile_fail_test_bimap_info_2 SOURCES compile_fail/test_bimap_info_2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME compile_fail_test_bimap_info_3 SOURCES compile_fail/test_bimap_info_3.cpp COMPILE_ONLY WILL_FAIL)

bcm_test(NAME example_bimap_and_boost_property_map SOURCES ../example/bimap_and_boost/property_map.cpp)
bcm_test(NAME example_bimap_and_boost_range SOURCES ../example/bimap_and_boost/range.cpp)
bcm_test(NAME example_bimap_and_boost_foreach SOURCES ../example/bimap_and_boost/foreach.cpp)
bcm_test(NAME example_bimap_and_boost_lambda SOURCES ../example/bimap_and_boost/lambda.cpp)
bcm_test(NAME example_bimap_and_boost_assign SOURCES ../example/bimap_and_boost/assign.cpp)
if(boost_xpressive_FOUND)
bcm_test(NAME example_bimap_and_boost_xpressive SOURCES ../example/bimap_and_boost/xpressive.cpp)
target_link_libraries(example_bimap_and_boost_xpressive boost::xpressive)
endif()
bcm_test(NAME example_bimap_and_boost_typeof SOURCES ../example/bimap_and_boost/typeof.cpp)
bcm_test(NAME example_bimap_and_boost_serialization SOURCES ../example/bimap_and_boost/serialization.cpp COMPILE_ONLY)

