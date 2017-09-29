include(BCMTest)

find_package(boost_tuple)
find_package(boost_smart_ptr)
find_package(boost_utility)

bcm_test_link_libraries(boost_container
boost::tuple
boost::smart_ptr
boost::utility
)


