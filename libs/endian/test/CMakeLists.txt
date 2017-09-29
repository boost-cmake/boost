include(BCMTest)

find_package(boost_random)
find_package(boost_detail)
find_package(boost_timer)
find_package(boost_lexical_cast)

bcm_test_link_libraries(boost_endian
boost::random
boost::detail
boost::timer
boost::lexical_cast
)

# Boost Endian Library test Jamfile

# Copyright Beman Dawes 2006, 2013

# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

# See library home page at http://www.boost.org/libs/endian


bcm_test(NAME buffer_test SOURCES buffer_test.cpp)
bcm_test(NAME endian_test SOURCES endian_test.cpp)
bcm_test(NAME endian_operations_test SOURCES endian_operations_test.cpp)
bcm_test(NAME endian_in_union_test SOURCES endian_in_union_test.cpp)
bcm_test(NAME conversion_test SOURCES conversion_test.cpp)
#         [ run floating_point_test.cpp : : : <test-info>always_show_run_output ]

