include(BCMTest)

find_package(boost_test)

bcm_test_link_libraries(boost_tuple
boost::test
)


bcm_test_link_libraries(boost::test_exec_monitor)

bcm_test(NAME tuple_test_bench SOURCES tuple_test_bench.cpp)
bcm_test(NAME io_test SOURCES io_test.cpp)
bcm_test(NAME another_tuple_test_bench SOURCES another_tuple_test_bench.cpp)

