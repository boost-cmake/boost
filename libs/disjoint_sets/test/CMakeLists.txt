include(BCMTest)

find_package(boost_test)
find_package(boost_detail)

bcm_test_link_libraries(boost_disjoint_sets
boost::test
boost::detail
)


