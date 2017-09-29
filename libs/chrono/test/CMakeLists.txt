include(BCMTest)

find_package(boost_rational)

bcm_test_link_libraries(boost_chrono
boost::rational
)


