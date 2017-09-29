include(BCMTest)

find_package(boost_mpl)
find_package(boost_preprocessor)
find_package(boost_test)

bcm_test_link_libraries(boost_rational
boost::mpl
boost::preprocessor
boost::test
)


