include(BCMTest)

find_package(boost_function)
find_package(boost_bind)
find_package(boost_random)
find_package(boost_static_assert)
find_package(boost_timer)
find_package(boost_array)

bcm_test_link_libraries(boost_convert
boost::function
boost::bind
boost::random
boost::static_assert
boost::timer
boost::array
)


