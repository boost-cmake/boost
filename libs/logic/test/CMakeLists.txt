include(BCMTest)

find_package(boost_test)

bcm_test_link_libraries(boost_logic
boost::test
)

# Tribool library

# Copyright (C) 2002-2003 Douglas Gregor

# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org/

bcm_test(NAME tribool_test SOURCES tribool_test.cpp)
bcm_test(NAME tribool_rename_test SOURCES tribool_rename_test.cpp)
bcm_test(NAME tribool_io_test SOURCES tribool_io_test.cpp)



