include(BCMTest)

find_package(boost_fusion)
find_package(boost_test)
find_package(boost_lexical_cast)
find_package(boost_array)

bcm_test_link_libraries(boost_variant
boost::fusion
boost::test
boost::lexical_cast
boost::array
)

#  Boost.Variant Library test Jamfile
#
#  Copyright (C) 2003, Eric Friedman, Itay Maman.
#  Copyright (C) 2013, Antony Polukhin.
#
# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)
#
#<dependency>/boost/test//minimal

bcm_test(NAME variant_test1 SOURCES test1.cpp class_a.cpp)
bcm_test(NAME variant_test2 SOURCES test2.cpp)
bcm_test(NAME variant_test3 SOURCES test3.cpp)
bcm_test(NAME variant_test3_no_rtti SOURCES test3.cpp)
set_target_properties(variant_test3_no_rtti PROPERTIES CXX_RTTI off)
target_compile_definitions(variant_test3_no_rtti PUBLIC BOOST_NO_TYPEID)
bcm_test(NAME variant_test4 SOURCES test4.cpp class_a.cpp)
bcm_test(NAME variant_test5 SOURCES test5.cpp)
bcm_test(NAME variant_test6 SOURCES test6.cpp)
bcm_test(NAME variant_test7 SOURCES test7.cpp)
bcm_test(NAME variant_test8 SOURCES test8.cpp)
bcm_test(NAME variant_test9 SOURCES test9.cpp)
bcm_test(NAME recursive_variant_test SOURCES recursive_variant_test.cpp)
bcm_test(NAME variant_reference_test SOURCES variant_reference_test.cpp)
bcm_test(NAME variant_comparison_test SOURCES variant_comparison_test.cpp)
bcm_test(NAME variant_visit_test SOURCES variant_visit_test.cpp)
bcm_test(NAME variant_get_test SOURCES variant_get_test.cpp)
bcm_test(NAME variant_polymorphic_get_test SOURCES variant_polymorphic_get_test.cpp)
bcm_test(NAME variant_multivisit_test SOURCES variant_multivisit_test.cpp)
bcm_test(NAME hash_variant_test SOURCES hash_variant_test.cpp)
bcm_test(NAME rvalue_test SOURCES rvalue_test.cpp)
bcm_test(NAME variant_nonempty_check SOURCES variant_nonempty_check.cpp)
bcm_test(NAME variant_noexcept_test SOURCES recursive_variant_test.cpp)
target_compile_definitions(variant_noexcept_test PUBLIC BOOST_NO_EXCEPTIONS)
bcm_test(NAME variant_no_rtti_test SOURCES recursive_variant_test.cpp)
set_target_properties(variant_no_rtti_test PROPERTIES CXX_RTTI off)
target_compile_definitions(variant_no_rtti_test PUBLIC BOOST_NO_TYPEID)
bcm_test(NAME hash_recursive_variant_test SOURCES hash_recursive_variant_test.cpp)
bcm_test(NAME variant_swap_test SOURCES variant_swap_test.cpp)
bcm_test(NAME auto_visitors SOURCES auto_visitors.cpp)
bcm_test(NAME overload_selection SOURCES overload_selection.cpp)
bcm_test(NAME recursive_wrapper_move_test SOURCES recursive_wrapper_move_test.cpp)



