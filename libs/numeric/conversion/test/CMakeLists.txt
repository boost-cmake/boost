include(BCMTest)

find_package(boost_test)
find_package(boost_utility)

bcm_test_link_libraries(boost_numeric_conversion
boost::test
boost::utility
)

# Boost Numeric Conversion Library test Jamfile
#
# Copyright (C) 2003, Fernando Luis Cacciola Carballal.
#
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)
#
# import testing ;


bcm_test(NAME bounds_test SOURCES bounds_test.cpp)
bcm_test(NAME traits_test SOURCES traits_test.cpp)
bcm_test(NAME converter_test SOURCES converter_test.cpp)
bcm_test(NAME udt_support_test SOURCES udt_support_test.cpp)
bcm_test(NAME numeric_cast_test SOURCES numeric_cast_test.cpp)
bcm_test(NAME udt_example_0 SOURCES udt_example_0.cpp)
bcm_test(NAME numeric_cast_traits_test SOURCES numeric_cast_traits_test.cpp)

bcm_test(NAME compile_fail_built_in_numeric_cast_traits SOURCES compile_fail/built_in_numeric_cast_traits.cpp COMPILE_ONLY WILL_FAIL)



# support the old test target

