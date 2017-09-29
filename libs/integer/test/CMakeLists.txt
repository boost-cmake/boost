include(BCMTest)

find_package(boost_core)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_type_traits)
find_package(boost_utility)

bcm_test_link_libraries(boost_integer
boost::core
boost::mpl
boost::detail
boost::type_traits
boost::utility
)

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)



bcm_test(NAME integer_traits_test SOURCES integer_traits_test.cpp)
bcm_test(NAME integer_test SOURCES integer_test.cpp)
bcm_test(NAME integer_mask_test SOURCES integer_mask_test.cpp)
bcm_test(NAME static_log2_test SOURCES static_log2_test.cpp)
bcm_test(NAME static_min_max_test SOURCES static_min_max_test.cpp)
bcm_test(NAME integer_traits_include_test SOURCES integer_traits_include_test.cpp COMPILE_ONLY)
bcm_test(NAME integer_include_test SOURCES integer_include_test.cpp COMPILE_ONLY)
bcm_test(NAME integer_mask_include_test SOURCES integer_mask_include_test.cpp COMPILE_ONLY)
bcm_test(NAME static_log2_include_test SOURCES static_log2_include_test.cpp COMPILE_ONLY)
bcm_test(NAME static_min_max_include_test SOURCES static_min_max_include_test.cpp COMPILE_ONLY)
bcm_test(NAME integer_fwd_include_test SOURCES integer_fwd_include_test.cpp COMPILE_ONLY)
bcm_test(NAME fail_int_exact SOURCES fail_int_exact.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_int_fast SOURCES fail_int_fast.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_int_least SOURCES fail_int_least.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_uint_exact SOURCES fail_uint_exact.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_uint_fast SOURCES fail_uint_fast.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_uint_least SOURCES fail_uint_least.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME fail_uint_65 SOURCES fail_uint_65.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME common_factor_test SOURCES common_factor_test.cpp)

