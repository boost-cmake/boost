include(BCMTest)

find_package(boost_random)
find_package(boost_smart_ptr)
find_package(boost_test)
find_package(boost_foreach)

bcm_test_link_libraries(boost_heap
boost::random
boost::smart_ptr
boost::test
boost::foreach
)

# (C) Copyright 2010: Tim Blechmann
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)




