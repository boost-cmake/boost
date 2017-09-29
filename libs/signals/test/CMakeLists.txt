include(BCMTest)

find_package(boost_property_map)
find_package(boost_bind)
find_package(boost_random)
find_package(boost_graph)
find_package(boost_test)

bcm_test_link_libraries(boost_signals
boost::property_map
boost::bind
boost::random
boost::graph
boost::test
)

# Boost.Signals Library

# Copyright Douglas Gregor 2001-2003. Use, modification and
# distribution is subject to the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org

# bring in rules for testing







bcm_test(NAME dead_slot_test SOURCES dead_slot_test.cpp)
bcm_test(NAME deletion_test SOURCES deletion_test.cpp)
bcm_test(NAME ordering_test SOURCES ordering_test.cpp)
bcm_test(NAME signal_n_test SOURCES signal_n_test.cpp)
bcm_test(NAME signal_test SOURCES signal_test.cpp)
bcm_test(NAME trackable_test SOURCES trackable_test.cpp)
bcm_test(NAME swap_test SOURCES swap_test.cpp)


