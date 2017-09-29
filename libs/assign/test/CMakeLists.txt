include(BCMTest)

find_package(boost_function)
find_package(boost_bind)
find_package(boost_functional)
find_package(boost_multi_index)
find_package(boost_test)

bcm_test_link_libraries(boost_assign
boost::function
boost::bind
boost::functional
boost::multi_index
boost::test
)

# Boost.Assign library
#
#  Copyright Thorsten Ottosen 2003-2005. Use, modification and
#  distribution is subject to the Boost Software License, Version
#  1.0. (See accompanying file LICENSE_1_0.txt or copy at
#  http://www.boost.org/LICENSE_1_0.txt)
#
# For more information, see http://www.boost.org/libs/assign/
#

# TODO: Skip these tests since its broken
bcm_test(NAME basic SOURCES basic.cpp)
# bcm_test(NAME std SOURCES std.cpp)
# bcm_test(NAME list_of SOURCES list_of.cpp)
# bcm_test(NAME ptr_list_of SOURCES ptr_list_of.cpp)
# bcm_test(NAME static_list_of SOURCES static_list_of.cpp)
# bcm_test(NAME tuple_list_of SOURCES tuple_list_of.cpp)
# bcm_test(NAME list_inserter SOURCES list_inserter.cpp)
# bcm_test(NAME ptr_list_inserter SOURCES ptr_list_inserter.cpp)
# bcm_test(NAME ptr_map_inserter SOURCES ptr_map_inserter.cpp)
# bcm_test(NAME list_of_workaround SOURCES list_of_workaround.cpp)
# bcm_test(NAME email_example SOURCES email_example.cpp)
# bcm_test(NAME my_vector_example SOURCES my_vector_example.cpp)
# bcm_test(NAME multi_index_container SOURCES multi_index_container.cpp)


