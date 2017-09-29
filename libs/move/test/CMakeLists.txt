include(BCMTest)

find_package(boost_container)
find_package(boost_timer)

bcm_test_link_libraries(boost_move
boost::container
boost::timer
)

##############################################################################
##
## (C) Copyright Ion Gaztanaga 2008-2009 Distributed under the Boost
## Software License, Version 1.0. (See accompanying file
## LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
##
##
##############################################################################

file(GLOB TEST_FILES *.cpp)
foreach(FILEB ${TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    bcm_test(NAME move-${NAME} SOURCES ${FILEB})
endforeach()





