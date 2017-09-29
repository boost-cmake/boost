include(BCMTest)

find_package(boost_bind)
find_package(boost_accumulators)
find_package(boost_concept_check)
find_package(boost_test)

bcm_test_link_libraries(boost_compute
boost::bind
boost::accumulators
boost::concept_check
boost::test
)


