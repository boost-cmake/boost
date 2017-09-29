include(BCMTest)

find_package(boost_any)
find_package(boost_program_options)
find_package(boost_lexical_cast)

bcm_test_link_libraries(boost_wave
boost::any
boost::program_options
boost::lexical_cast
)


