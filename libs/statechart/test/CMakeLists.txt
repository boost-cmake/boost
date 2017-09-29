include(BCMTest)

find_package(boost_test)

bcm_test_link_libraries(boost_statechart
boost::test
)


