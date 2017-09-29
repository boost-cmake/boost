include(BCMTest)

find_package(boost_random)
find_package(boost_program_options)
find_package(boost_foreach)
find_package(boost_test)
find_package(boost_typeof)
find_package(boost_optional)
find_package(boost_timer)
find_package(boost_ptr_container)
find_package(boost_numeric_conversion)
find_package(boost_assign)

bcm_test_link_libraries(boost_geometry
boost::random
boost::program_options
boost::foreach
boost::test
boost::typeof
boost::optional
boost::timer
boost::ptr_container
boost::numeric_conversion
boost::assign
)


