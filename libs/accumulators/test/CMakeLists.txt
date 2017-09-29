include(BCMTest)

find_package(boost_random)
find_package(boost_foreach)
find_package(boost_test)

bcm_test_link_libraries(boost_accumulators
boost::random
boost::foreach
boost::test
)

# (C) Copyright 2005: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing

# TODO: Tests disabled because of problems in ublas
bcm_test(NAME count SOURCES count.cpp)
# bcm_test(NAME covariance SOURCES covariance.cpp)
bcm_test(NAME droppable SOURCES droppable.cpp)
bcm_test(NAME error_of SOURCES error_of.cpp)
bcm_test(NAME extended_p_square SOURCES extended_p_square.cpp)
bcm_test(NAME extended_p_square_quantile SOURCES extended_p_square_quantile.cpp)
bcm_test(NAME external_accumulator SOURCES external_accumulator.cpp)
bcm_test(NAME external_weights SOURCES external_weights.cpp)
bcm_test(NAME kurtosis SOURCES kurtosis.cpp)
bcm_test(NAME max SOURCES max.cpp)
bcm_test(NAME mean SOURCES mean.cpp)
bcm_test(NAME median SOURCES median.cpp)
bcm_test(NAME min SOURCES min.cpp)
bcm_test(NAME moment SOURCES moment.cpp)
# bcm_test(NAME pot_quantile SOURCES pot_quantile.cpp)
bcm_test(NAME p_square_cumul_dist SOURCES p_square_cumul_dist.cpp)
bcm_test(NAME p_square_quantile SOURCES p_square_quantile.cpp)
bcm_test(NAME reference SOURCES reference.cpp)
bcm_test(NAME rolling_count SOURCES rolling_count.cpp)
bcm_test(NAME rolling_sum SOURCES rolling_sum.cpp)
bcm_test(NAME rolling_mean SOURCES rolling_mean.cpp)
bcm_test(NAME skewness SOURCES skewness.cpp)
bcm_test(NAME sum SOURCES sum.cpp)
bcm_test(NAME sum_kahan SOURCES sum_kahan.cpp)
bcm_test(NAME tail SOURCES tail.cpp)
bcm_test(NAME tail_mean SOURCES tail_mean.cpp)
bcm_test(NAME tail_quantile SOURCES tail_quantile.cpp)
bcm_test(NAME tail_variate_means SOURCES tail_variate_means.cpp)
bcm_test(NAME valarray SOURCES valarray.cpp)
bcm_test(NAME variance SOURCES variance.cpp)
bcm_test(NAME vector SOURCES vector.cpp)
# bcm_test(NAME weighted_covariance SOURCES weighted_covariance.cpp)
bcm_test(NAME weighted_extended_p_square SOURCES weighted_extended_p_square.cpp)
bcm_test(NAME weighted_kurtosis SOURCES weighted_kurtosis.cpp)
bcm_test(NAME weighted_mean SOURCES weighted_mean.cpp)
bcm_test(NAME weighted_median SOURCES weighted_median.cpp)
bcm_test(NAME weighted_moment SOURCES weighted_moment.cpp)
bcm_test(NAME weighted_p_square_cumul_dist SOURCES weighted_p_square_cumul_dist.cpp)
bcm_test(NAME weighted_p_square_quantile SOURCES weighted_p_square_quantile.cpp)
bcm_test(NAME weighted_skewness SOURCES weighted_skewness.cpp)
bcm_test(NAME weighted_sum SOURCES weighted_sum.cpp)
bcm_test(NAME weighted_sum_kahan SOURCES weighted_sum_kahan.cpp)
bcm_test(NAME weighted_variance SOURCES weighted_variance.cpp)
# bcm_test(NAME weighted_pot_quantile SOURCES weighted_pot_quantile.cpp)
# bcm_test(NAME weighted_tail_mean SOURCES weighted_tail_mean.cpp)
# bcm_test(NAME weighted_tail_quantile SOURCES weighted_tail_quantile.cpp)
# bcm_test(NAME weighted_tail_variate_means SOURCES weighted_tail_variate_means.cpp)


