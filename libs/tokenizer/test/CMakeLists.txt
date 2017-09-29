include(BCMTest)

find_package(boost_test)
find_package(boost_array)

bcm_test_link_libraries(boost_tokenizer
boost::test
boost::array
)

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME examples SOURCES examples.cpp)
bcm_test(NAME simple_example_1 SOURCES simple_example_1.cpp)
bcm_test(NAME simple_example_2 SOURCES simple_example_2.cpp)
bcm_test(NAME simple_example_3 SOURCES simple_example_3.cpp)
bcm_test(NAME simple_example_4 SOURCES simple_example_4.cpp)
bcm_test(NAME simple_example_5 SOURCES simple_example_5.cpp)

