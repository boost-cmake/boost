include(BCMTest)

find_package(boost_thread)
find_package(boost_interprocess)
find_package(boost_smart_ptr)
find_package(boost_test)
find_package(boost_foreach)

bcm_test_link_libraries(boost_lockfree
boost::thread
boost::interprocess
boost::smart_ptr
boost::test
boost::foreach
)

# (C) Copyright 2010: Tim Blechmann
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

file(GLOB TEST_FILES *.cpp)
foreach(FILEB ${TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    bcm_test(NAME lockfree-${NAME} SOURCES ${FILEB})
endforeach()

