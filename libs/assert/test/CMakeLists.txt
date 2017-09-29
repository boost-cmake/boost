include(BCMTest)

find_package(boost_core)

bcm_test_link_libraries(boost_assert
boost::core
)

bcm_test(NAME assert_test SOURCES assert_test.cpp)
bcm_test(NAME current_function_test SOURCES current_function_test.cpp)
bcm_test(NAME verify_test SOURCES verify_test.cpp)
bcm_test(NAME assert_is_void_test SOURCES assert_is_void_test.cpp)

# expansion tests are in exp/ so that there is a backslash in the path on Windows
bcm_test(NAME assert_exp_test SOURCES exp/assert_exp_test.cpp)
bcm_test(NAME assert_msg_exp_test SOURCES exp/assert_msg_exp_test.cpp)
bcm_test(NAME verify_exp_test SOURCES exp/verify_exp_test.cpp)
bcm_test(NAME verify_msg_exp_test SOURCES exp/verify_msg_exp_test.cpp)
bcm_test(NAME assert_test2 SOURCES assert_test2.cpp)
bcm_test(NAME assert_msg_test2 SOURCES assert_msg_test2.cpp)

