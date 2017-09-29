include(BCMTest)

find_package(boost_thread)
find_package(boost_bind)
find_package(boost_timer)
find_package(boost_test)

bcm_test_link_libraries(boost_circular_buffer
boost::thread
boost::bind
boost::timer
boost::test
)

# Boost circular_buffer test Jamfile.
#
# Copyright (c) 2003-2008 Jan Gaspar
#
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# Added warning suppression Paul A. Bristow 25 Nov 2008

# Bring in rules for testing.


bcm_test(NAME base_test SOURCES base_test.cpp)
bcm_test(NAME space_optimized_test SOURCES space_optimized_test.cpp)
bcm_test(NAME base_test_dbg SOURCES base_test.cpp)
bcm_test(NAME space_optimized_test_dbg SOURCES space_optimized_test.cpp)
bcm_test(NAME soft_iterator_invalidation SOURCES soft_iterator_invalidation.cpp)
bcm_test(NAME constant_erase_test SOURCES constant_erase_test.cpp)
bcm_test(NAME bounded_buffer_comparison SOURCES bounded_buffer_comparison.cpp COMPILE_ONLY)

