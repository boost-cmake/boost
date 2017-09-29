include(BCMTest)

find_package(boost_tuple)
find_package(boost_bind)
find_package(boost_foreach)
find_package(boost_test)
find_package(boost_lexical_cast)

bcm_test_link_libraries(boost_coroutine
boost::tuple
boost::bind
boost::foreach
boost::test
boost::lexical_cast
)

# Boost.Coroutine Library Tests Jamfile

#          Copyright Oliver Kowalke 2009.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)



bcm_test(NAME test_asymmetric_coroutine SOURCES test_asymmetric_coroutine.cpp)
bcm_test(NAME test_symmetric_coroutine SOURCES test_symmetric_coroutine.cpp)

