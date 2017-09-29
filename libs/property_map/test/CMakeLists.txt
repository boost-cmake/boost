include(BCMTest)

find_package(boost_test)

bcm_test_link_libraries(boost_property_map
boost::test
)

# Function library

# Copyright (C) 2005 Trustees of Indiana University
#
# Author: Douglas Gregor
#
# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org/

bcm_test(NAME property_map_cc SOURCES property_map_cc.cpp COMPILE_ONLY)
bcm_test(NAME compose_property_map_test SOURCES compose_property_map_test.cpp)
bcm_test(NAME dynamic_properties_test SOURCES dynamic_properties_test.cpp)
bcm_test(NAME function_property_map_test SOURCES function_property_map_test.cpp)
bcm_test(NAME transform_value_property_map_test SOURCES transform_value_property_map_test.cpp)

