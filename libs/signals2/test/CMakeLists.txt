include(BCMTest)

find_package(boost_thread)
find_package(boost_timer)
find_package(boost_signals)
find_package(boost_test)
find_package(boost_array)

bcm_test_link_libraries(boost_signals2
boost::thread
boost::timer
boost::signals
boost::test
boost::array
)

# Boost.Signals2 Library

# Copyright Douglas Gregor 2001-2003.
# Copyright Frank Mori Hess 2009.
# Use, modification and
# distribution is subject to the Boost Software License, Version
# 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# For more information, see http://www.boost.org

# bring in rules for testing


bcm_test(NAME signals2_connection_test SOURCES connection_test.cpp)
bcm_test(NAME signals2_dead_slot_test SOURCES dead_slot_test.cpp)
bcm_test(NAME signals2_deconstruct_test SOURCES deconstruct_test.cpp)
bcm_test(NAME signals2_deletion_test SOURCES deletion_test.cpp)
# TODO: Remove Boost.Thread from directory test and add it explictly for mutex_test
bcm_test(NAME signals2_mutex_test SOURCES mutex_test.cpp)
bcm_test(NAME signals2_ordering_test SOURCES ordering_test.cpp)
bcm_test(NAME signals2_regression_test SOURCES regression_test.cpp)
bcm_test(NAME signals2_shared_connection_block_test SOURCES shared_connection_block_test.cpp)
bcm_test(NAME signals2_signal_n_test SOURCES signal_n_test.cpp)
bcm_test(NAME signals2_signal_test SOURCES signal_test.cpp)
bcm_test(NAME signals2_signal_type_test SOURCES signal_type_test.cpp)
bcm_test(NAME signals2_slot_compile_test SOURCES slot_compile_test.cpp)
# TODO: Remove Boost.Thread from directory test and add it explictly for threading_models_test
bcm_test(NAME signals2_threading_models_test SOURCES threading_models_test.cpp)
bcm_test(NAME signals2_trackable_test SOURCES trackable_test.cpp)
bcm_test(NAME signals2_track_test SOURCES track_test.cpp)

