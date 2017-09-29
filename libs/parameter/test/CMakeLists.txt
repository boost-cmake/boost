include(BCMTest)

find_package(boost_static_assert)
find_package(boost_tuple)
find_package(boost_bind)
find_package(boost_timer)
find_package(boost_assert)
find_package(boost_graph)

bcm_test_link_libraries(boost_parameter
boost::static_assert
boost::tuple
boost::bind
boost::timer
boost::assert
boost::graph
)

# Copyright David Abrahams, Daniel Wallin 2006. Distributed under the
# Boost Software License, Version 1.0. (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# Boost Parameter Library test Jamfile




bcm_test(NAME basics SOURCES basics.cpp)
bcm_test(NAME sfinae SOURCES sfinae.cpp)
bcm_test(NAME macros SOURCES macros.cpp)
bcm_test(NAME earwicker SOURCES earwicker.cpp)
bcm_test(NAME tutorial SOURCES tutorial.cpp)
bcm_test(NAME singular SOURCES singular.cpp)
bcm_test(NAME mpl SOURCES mpl.cpp)
bcm_test(NAME preprocessor SOURCES preprocessor.cpp)
bcm_test(NAME preprocessor_deduced SOURCES preprocessor_deduced.cpp)
bcm_test(NAME efficiency SOURCES efficiency.cpp)
bcm_test(NAME maybe SOURCES maybe.cpp)
bcm_test(NAME deduced SOURCES deduced.cpp)
bcm_test(NAME optional_deduced_sfinae SOURCES optional_deduced_sfinae.cpp)
bcm_test(NAME deduced_dependent_predicate SOURCES deduced_dependent_predicate.cpp)
bcm_test(NAME normalized_argument_types SOURCES normalized_argument_types.cpp)
bcm_test(NAME ntp SOURCES ntp.cpp COMPILE_ONLY)
bcm_test(NAME unwrap_cv_reference SOURCES unwrap_cv_reference.cpp COMPILE_ONLY)
bcm_test(NAME duplicates SOURCES duplicates.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME deduced_unmatched_arg SOURCES deduced_unmatched_arg.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME compose SOURCES compose.cpp COMPILE_ONLY)


