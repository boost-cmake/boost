include(BCMTest)

find_package(boost_function)
find_package(boost_core)
find_package(boost_thread)
find_package(boost_date_time)
find_package(boost_bind)

bcm_test_link_libraries(boost_atomic
boost::function
boost::core
boost::thread
boost::date_time
boost::bind
)

#  Boost.Atomic Library test Jamfile
#
#  Copyright (c) 2011 Helge Bahmann
#  Copyright (c) 2012 Tim Blechmann
#
#  Distributed under the Boost Software License, Version 1.0. (See
#  accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt)



bcm_test(NAME native_api SOURCES native_api.cpp)
bcm_test(NAME fallback_api SOURCES fallback_api.cpp)
bcm_test(NAME atomicity SOURCES atomicity.cpp)
bcm_test(NAME ordering SOURCES ordering.cpp)
bcm_test(NAME lockfree SOURCES lockfree.cpp)

