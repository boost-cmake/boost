include(BCMTest)

find_package(boost_test)

bcm_test_link_libraries(boost_format
boost::test
)

#  Boost.Format Library test Jamfile
#
#  Copyright (c) 2003 Samuel Krempp
#
#  Distributed under the Boost Software License, Version 1.0. (See accompany-
#  ing file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

bcm_test_link_libraries(boost::test_exec_monitor)

bcm_test(NAME format_test1 SOURCES format_test1.cpp)
bcm_test(NAME format_test2 SOURCES format_test2.cpp)
bcm_test(NAME format_test3 SOURCES format_test3.cpp)
bcm_test(NAME format_test_wstring SOURCES format_test_wstring.cpp)
bcm_test(NAME format_test_enum SOURCES format_test_enum.cpp)


