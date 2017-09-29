include(BCMTest)

find_package(boost_test)
find_package(boost_functional)

bcm_test_link_libraries(boost_array
boost::test
boost::functional
)

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)



bcm_test(NAME array0 SOURCES array0.cpp)
bcm_test(NAME array1 SOURCES array1.cpp)
bcm_test(NAME array2 SOURCES array2.cpp)
bcm_test(NAME array3 SOURCES array3.cpp)
bcm_test(NAME array4 SOURCES array4.cpp)
bcm_test(NAME array5 SOURCES array5.cpp)
bcm_test(NAME array6 SOURCES array6.cpp)
bcm_test(NAME array7 SOURCES array7.cpp)
bcm_test(NAME array_getfail1 SOURCES array_getfail1.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME array_getfail2 SOURCES array_getfail2.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME array_hash SOURCES array_hash.cpp)

