include(BCMTest)

find_package(boost_move)

bcm_test_link_libraries(boost_any
boost::move
)


