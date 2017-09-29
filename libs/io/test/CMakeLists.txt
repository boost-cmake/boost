include(BCMTest)

find_package(boost_test)
find_package(boost_core)
find_package(boost_detail)

bcm_test_link_libraries(boost_io
boost::test
boost::core
boost::detail
)

#  Boost.IO Library test Jamfile
#
#  Copyright 2003 Daryle Walker.  Use, modification, and distribution
#  are subject to the Boost Software License, Version 1.0.  (See
#  accompanying file LICENSE_1_0.txt or a copy at
#  <http://www.boost.org/LICENSE_1_0.txt>.)
#
#  See <http://www.boost.org/libs/io/> for the library's home page.

bcm_test(NAME ios_state_unit_test SOURCES ios_state_unit_test.cpp)

bcm_test(NAME ios_state_test SOURCES ios_state_test.cpp)

bcm_test(NAME quoted_manip_test SOURCES quoted_manip_test.cpp)

