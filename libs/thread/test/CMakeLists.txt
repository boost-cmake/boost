include(BCMTest)

find_package(boost_asio)
find_package(boost_interprocess)
find_package(boost_test)
find_package(boost_unordered)

bcm_test_link_libraries(boost_thread
boost::asio
boost::interprocess
boost::test
boost::unordered
)


