include(BCMTest)

find_package(boost_tuple)
find_package(boost_bind)
find_package(boost_functional)
find_package(boost_timer)
find_package(boost_test)
find_package(boost_lexical_cast)
find_package(boost_lambda)
find_package(boost_assign)
find_package(boost_numeric_conversion)

bcm_test_link_libraries(boost_ptr_container
boost::tuple
boost::bind
boost::functional
boost::timer
boost::test
boost::lexical_cast
boost::lambda
boost::assign
boost::numeric_conversion
)

#//
#// Boost.Pointer Container
#//
#//  Copyright Thorsten Ottosen 2003-2008. Use, modification and
#//  distribution is subject to the Boost Software License, Version
#//  1.0. (See accompanying file LICENSE_1_0.txt or copy at
#//  http://www.boost.org/LICENSE_1_0.txt)
#//
#// For more information, see http://www.boost.org/libs/ptr_container/
#//



bcm_test(NAME ptr_inserter SOURCES ptr_inserter.cpp)
bcm_test(NAME ptr_vector SOURCES ptr_vector.cpp)
# bcm_test(NAME ptr_list SOURCES ptr_list.cpp)
bcm_test(NAME ptr_deque SOURCES ptr_deque.cpp)
bcm_test(NAME ptr_set SOURCES ptr_set.cpp)
bcm_test(NAME ptr_map SOURCES ptr_map.cpp)
bcm_test(NAME ptr_map_adapter SOURCES ptr_map_adapter.cpp)
bcm_test(NAME ptr_array SOURCES ptr_array.cpp)
bcm_test(NAME tree_test SOURCES tree_test.cpp)
bcm_test(NAME incomplete_type_test SOURCES incomplete_type_test.cpp)
bcm_test(NAME view_example SOURCES view_example.cpp)
bcm_test(NAME iterator_test SOURCES iterator_test.cpp)
bcm_test(NAME tut1 SOURCES tut1.cpp)
bcm_test(NAME indirect_fun SOURCES indirect_fun.cpp)
bcm_test(NAME serialization SOURCES serialization.cpp)
bcm_test(NAME no_exceptions SOURCES no_exceptions.cpp)

bcm_test(NAME ptr_unordered_set SOURCES ptr_unordered_set.cpp)
bcm_test(NAME ptr_unordered_map SOURCES ptr_unordered_map.cpp)
bcm_test(NAME ptr_circular_buffer SOURCES ptr_circular_buffer.cpp)


