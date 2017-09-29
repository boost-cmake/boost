include(BCMTest)

find_package(boost_assert)
find_package(boost_smart_ptr)
find_package(boost_test)

bcm_test_link_libraries(boost_proto
boost::assert
boost::smart_ptr
boost::test
)

# (C) Copyright 2004: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

#        <define>BOOST_PROTO_DONT_USE_PREPROCESSED_FILES

bcm_test(NAME proto_calculator SOURCES calculator.cpp)
bcm_test(NAME proto_constrained_ops SOURCES constrained_ops.cpp)
bcm_test(NAME proto_cpp-next_bug SOURCES cpp-next_bug.cpp)
bcm_test(NAME proto_deep_copy SOURCES deep_copy.cpp)
bcm_test(NAME proto_display_expr SOURCES display_expr.cpp)
bcm_test(NAME proto_deduce_domain SOURCES deduce_domain.cpp)
bcm_test(NAME proto_env_var SOURCES env_var.cpp)
# bcm_test(NAME proto_examples SOURCES examples.cpp)
bcm_test(NAME proto_external_transforms SOURCES external_transforms.cpp)
bcm_test(NAME proto_lambda SOURCES lambda.cpp)
bcm_test(NAME proto_make_expr SOURCES make_expr.cpp)
bcm_test(NAME proto_matches SOURCES matches.cpp)
bcm_test(NAME proto_flatten SOURCES flatten.cpp)
bcm_test(NAME proto_switch SOURCES switch.cpp)
bcm_test(NAME proto_toy_spirit SOURCES toy_spirit.cpp)
bcm_test(NAME proto_toy_spirit2 SOURCES toy_spirit2.cpp)
bcm_test(NAME proto_make SOURCES make.cpp)
bcm_test(NAME proto_mem_ptr SOURCES mem_ptr.cpp)
bcm_test(NAME proto_mpl SOURCES mpl.cpp)
bcm_test(NAME proto_noinvoke SOURCES noinvoke.cpp)
bcm_test(NAME proto_pack_expansion SOURCES pack_expansion.cpp)
bcm_test(NAME proto_protect SOURCES protect.cpp)
bcm_test(NAME proto_bug2407 SOURCES bug2407.cpp COMPILE_ONLY)


