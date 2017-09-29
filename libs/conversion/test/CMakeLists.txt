include(BCMTest)

find_package(boost_core)

bcm_test_link_libraries(boost_conversion
boost::core
)

# Copyright (C) 2001-2003 Douglas Gregor
# Copyright (C) 2011-2014 Antony Polukhin
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#



bcm_test(NAME implicit_cast SOURCES implicit_cast.cpp)
bcm_test(NAME implicit_cast_fail SOURCES implicit_cast_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME cast_test SOURCES cast_test.cpp)
bcm_test(NAME polymorphic_cast_test SOURCES polymorphic_cast_test.cpp)
bcm_test(NAME implicit_cast_fail2 SOURCES implicit_cast_fail2.cpp COMPILE_ONLY WILL_FAIL)

