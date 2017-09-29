include(BCMTest)

find_package(boost_multiprecision)
find_package(boost_thread)
find_package(boost_lexical_cast)

bcm_test_link_libraries(boost_test
boost::multiprecision
boost::thread
boost::lexical_cast
)


