include(BCMTest)

find_package(boost_random)
find_package(boost_detail)
find_package(boost_timer)
find_package(boost_test)

bcm_test_link_libraries(boost_crc
boost::random
boost::detail
boost::timer
boost::test
)

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)



bcm_test(NAME crc_test SOURCES crc_test.cpp)

