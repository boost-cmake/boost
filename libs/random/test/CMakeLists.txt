include(BCMTest)

find_package(boost_preprocessor)
find_package(boost_exception)
find_package(boost_multiprecision)
find_package(boost_bind)
find_package(boost_concept_check)
find_package(boost_numeric_conversion)
find_package(boost_test)
find_package(boost_lexical_cast)
find_package(boost_assign)
find_package(boost_smart_ptr)

bcm_test_link_libraries(boost_random
boost::preprocessor
boost::exception
boost::multiprecision
boost::bind
boost::concept_check
boost::numeric_conversion
boost::test
boost::lexical_cast
boost::assign
boost::smart_ptr
)

# Copyright 2003 Jens Maurer
# Copyright 2009-2011 Steven Watanabe
# Distributed under the Boost Software License, Version 1.0. (See accompany-
# ing file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# Boost Random Library test Jamfile

# bring in rules for testing


bcm_test(NAME random_test_const_mod SOURCES test_const_mod.cpp)
bcm_test(NAME random_test_generate_canonical SOURCES test_generate_canonical.cpp)
bcm_test(NAME random_test_random_number_generator SOURCES test_random_number_generator.cpp)
bcm_test(NAME random____example_random_demo SOURCES ../example/random_demo.cpp)
bcm_test(NAME random_test_random_device SOURCES test_random_device.cpp)
bcm_test(NAME random_test_random_device_dll SOURCES test_random_device.cpp)

bcm_test(NAME random_test_minstd_rand0 SOURCES test_minstd_rand0.cpp)
bcm_test(NAME random_test_minstd_rand SOURCES test_minstd_rand.cpp)
bcm_test(NAME random_test_rand48 SOURCES test_rand48.cpp)
bcm_test(NAME random_test_mt11213b SOURCES test_mt11213b.cpp)
bcm_test(NAME random_test_mt19937 SOURCES test_mt19937.cpp)
bcm_test(NAME random_test_mt19937_64 SOURCES test_mt19937_64.cpp)
bcm_test(NAME random_test_ecuyer1988 SOURCES test_ecuyer1988.cpp)
bcm_test(NAME random_test_hellekalek1995 SOURCES test_hellekalek1995.cpp)
bcm_test(NAME random_test_linear_feedback_shift SOURCES test_linear_feedback_shift.cpp)
bcm_test(NAME random_test_taus88 SOURCES test_taus88.cpp)
bcm_test(NAME random_test_kreutzer1986 SOURCES test_kreutzer1986.cpp)
bcm_test(NAME random_test_ranlux3 SOURCES test_ranlux3.cpp)
bcm_test(NAME random_test_ranlux4 SOURCES test_ranlux4.cpp)
bcm_test(NAME random_test_ranlux3_01 SOURCES test_ranlux3_01.cpp)
bcm_test(NAME random_test_ranlux4_01 SOURCES test_ranlux4_01.cpp)
bcm_test(NAME random_test_ranlux64_4 SOURCES test_ranlux64_4.cpp)
bcm_test(NAME random_test_ranlux64_3 SOURCES test_ranlux64_3.cpp)
bcm_test(NAME random_test_ranlux64_3_01 SOURCES test_ranlux64_3_01.cpp)
bcm_test(NAME random_test_ranlux64_4_01 SOURCES test_ranlux64_4_01.cpp)
bcm_test(NAME random_test_ranlux24_base SOURCES test_ranlux24_base.cpp)
bcm_test(NAME random_test_ranlux24 SOURCES test_ranlux24.cpp)
bcm_test(NAME random_test_ranlux48_base SOURCES test_ranlux48_base.cpp)
bcm_test(NAME random_test_ranlux48 SOURCES test_ranlux48.cpp)
bcm_test(NAME random_test_knuth_b SOURCES test_knuth_b.cpp)
bcm_test(NAME random_test_independent_bits31 SOURCES test_independent_bits31.cpp)
bcm_test(NAME random_test_independent_bits32 SOURCES test_independent_bits32.cpp)
bcm_test(NAME random_test_lagged_fibonacci SOURCES test_lagged_fibonacci.cpp)
bcm_test(NAME random_test_lagged_fibonacci607 SOURCES test_lagged_fibonacci607.cpp)
bcm_test(NAME random_test_lagged_fibonacci1279 SOURCES test_lagged_fibonacci1279.cpp)
bcm_test(NAME random_test_lagged_fibonacci2281 SOURCES test_lagged_fibonacci2281.cpp)
bcm_test(NAME random_test_lagged_fibonacci3217 SOURCES test_lagged_fibonacci3217.cpp)
bcm_test(NAME random_test_lagged_fibonacci4423 SOURCES test_lagged_fibonacci4423.cpp)
bcm_test(NAME random_test_lagged_fibonacci9689 SOURCES test_lagged_fibonacci9689.cpp)
bcm_test(NAME random_test_lagged_fibonacci19937 SOURCES test_lagged_fibonacci19937.cpp)
bcm_test(NAME random_test_lagged_fibonacci23209 SOURCES test_lagged_fibonacci23209.cpp)
bcm_test(NAME random_test_lagged_fibonacci44497 SOURCES test_lagged_fibonacci44497.cpp)
bcm_test(NAME random_test_zero_seed SOURCES test_zero_seed.cpp)

# Disable by default.  These don't add much and the larger
# ones can overflow the stack.

bcm_test(NAME random_test_seed_seq SOURCES test_seed_seq.cpp)

bcm_test(NAME random_test_binomial SOURCES test_binomial.cpp)
bcm_test(NAME random_test_binomial_distribution SOURCES test_binomial_distribution.cpp)
bcm_test(NAME random_test_poisson SOURCES test_poisson.cpp)
bcm_test(NAME random_test_poisson_distribution SOURCES test_poisson_distribution.cpp)
bcm_test(NAME random_test_discrete SOURCES test_discrete.cpp)
bcm_test(NAME random_test_discrete_distribution SOURCES test_discrete_distribution.cpp)
bcm_test(NAME random_test_gamma SOURCES test_gamma.cpp)
bcm_test(NAME random_test_gamma_distribution SOURCES test_gamma_distribution.cpp)
bcm_test(NAME random_test_weibull SOURCES test_weibull.cpp)
bcm_test(NAME random_test_weibull_distribution SOURCES test_weibull_distribution.cpp)
bcm_test(NAME random_test_extreme_value SOURCES test_extreme_value.cpp)
bcm_test(NAME random_test_extreme_value_distribution SOURCES test_extreme_value_distribution.cpp)
bcm_test(NAME random_test_negative_binomial SOURCES test_negative_binomial.cpp)
bcm_test(NAME random_test_negative_binomial_distribution SOURCES test_negative_binomial_distribution.cpp)
bcm_test(NAME random_test_chi_squared SOURCES test_chi_squared.cpp)
bcm_test(NAME random_test_chi_squared_distribution SOURCES test_chi_squared_distribution.cpp)
bcm_test(NAME random_test_fisher_f SOURCES test_fisher_f.cpp)
bcm_test(NAME random_test_fisher_f_distribution SOURCES test_fisher_f_distribution.cpp)
bcm_test(NAME random_test_student_t SOURCES test_student_t.cpp)
bcm_test(NAME random_test_student_t_distribution SOURCES test_student_t_distribution.cpp)
bcm_test(NAME random_test_normal SOURCES test_normal.cpp)
bcm_test(NAME random_test_normal_distribution SOURCES test_normal_distribution.cpp)
bcm_test(NAME random_test_piecewise_constant SOURCES test_piecewise_constant.cpp)
bcm_test(NAME random_test_piecewise_constant_distribution SOURCES test_piecewise_constant_distribution.cpp)
bcm_test(NAME random_test_piecewise_linear SOURCES test_piecewise_linear.cpp)
bcm_test(NAME random_test_piecewise_linear_distribution SOURCES test_piecewise_linear_distribution.cpp)
bcm_test(NAME random_test_exponential SOURCES test_exponential.cpp)
bcm_test(NAME random_test_exponential_distribution SOURCES test_exponential_distribution.cpp)
bcm_test(NAME random_test_bernoulli SOURCES test_bernoulli.cpp)
bcm_test(NAME random_test_bernoulli_distribution SOURCES test_bernoulli_distribution.cpp)
bcm_test(NAME random_test_cauchy SOURCES test_cauchy.cpp)
bcm_test(NAME random_test_cauchy_distribution SOURCES test_cauchy_distribution.cpp)
bcm_test(NAME random_test_geometric SOURCES test_geometric.cpp)
bcm_test(NAME random_test_geometric_distribution SOURCES test_geometric_distribution.cpp)
bcm_test(NAME random_test_lognormal SOURCES test_lognormal.cpp)
bcm_test(NAME random_test_lognormal_distribution SOURCES test_lognormal_distribution.cpp)
bcm_test(NAME random_test_triangle SOURCES test_triangle.cpp)
bcm_test(NAME random_test_triangle_distribution SOURCES test_triangle_distribution.cpp)
bcm_test(NAME random_test_uniform_int SOURCES test_uniform_int.cpp)
bcm_test(NAME random_test_uniform_int_distribution SOURCES test_uniform_int_distribution.cpp)
bcm_test(NAME random_test_uniform_real SOURCES test_uniform_real.cpp)
bcm_test(NAME random_test_uniform_real_distribution SOURCES test_uniform_real_distribution.cpp)
bcm_test(NAME random_test_uniform_on_sphere SOURCES test_uniform_on_sphere.cpp)
bcm_test(NAME random_test_uniform_on_sphere_distribution SOURCES test_uniform_on_sphere_distribution.cpp)
bcm_test(NAME random_test_uniform_smallint SOURCES test_uniform_smallint.cpp)
bcm_test(NAME random_test_uniform_smallint_distribution SOURCES test_uniform_smallint_distribution.cpp)
bcm_test(NAME random_test_old_uniform_real SOURCES test_old_uniform_real.cpp)
bcm_test(NAME random_test_old_uniform_real_distribution SOURCES test_old_uniform_real_distribution.cpp)
bcm_test(NAME random_test_old_uniform_int SOURCES test_old_uniform_int.cpp)
bcm_test(NAME random_test_old_uniform_int_distribution SOURCES test_old_uniform_int_distribution.cpp)
bcm_test(NAME random_test_beta SOURCES test_beta.cpp)
bcm_test(NAME random_test_beta_distribution SOURCES test_beta_distribution.cpp)
bcm_test(NAME random_test_laplace SOURCES test_laplace.cpp)
bcm_test(NAME random_test_laplace_distribution SOURCES test_laplace_distribution.cpp)
bcm_test(NAME random_test_non_central_chi_squared SOURCES test_non_central_chi_squared.cpp)
bcm_test(NAME random_test_non_central_chi_squared_distribution SOURCES test_non_central_chi_squared_distribution.cpp)
bcm_test(NAME random_test_hyperexponential SOURCES test_hyperexponential.cpp)
bcm_test(NAME random_test_hyperexponential_distribution SOURCES test_hyperexponential_distribution.cpp)

# run nondet_random_speed.cpp ;
# run random_device.cpp ;
# run random_speed.cpp ;
# run statistic_tests.cpp ;



#
# Multiprecision tests:
#
bcm_test(NAME random_multiprecision_int_test SOURCES multiprecision_int_test.cpp)
# This one runs too slow in debug mode, we really need inline expansions turned on amonst other things:
bcm_test(NAME random_multiprecision_float_test SOURCES multiprecision_float_test.cpp)

