include(BCMTest)

find_package(boost_array)

bcm_test_link_libraries(boost_detail
boost::array
)

################################################################*# Jam #*#######
#   Copyright (C) 2010 Bryce Lelbach
#
#   Distributed under the Boost Software License, Version 1.0. (See accompanying
#   file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
################################################################################



# import rules for testing conditional on config file variables

bcm_test(NAME binary_search_test SOURCES binary_search_test.cpp)
bcm_test(NAME is_sorted_test SOURCES is_sorted_test.cpp)
bcm_test(NAME test_utf8_codecvt SOURCES test_utf8_codecvt.cpp)

