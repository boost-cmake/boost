include(BCMTest)

find_package(boost_function)
find_package(boost_core)
find_package(boost_thread)
find_package(boost_chrono)
find_package(boost_bind)
find_package(boost_atomic)
find_package(boost_test)
find_package(boost_utility)

bcm_test_link_libraries(boost_fiber
boost::function
boost::core
boost::thread
boost::chrono
boost::bind
boost::atomic
boost::test
boost::utility
)


