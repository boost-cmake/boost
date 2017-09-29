include(BCMTest)

find_package(boost_detail)

bcm_test_link_libraries(boost_timer
boost::detail
)

# Boost Timer Library test Jamfile

# Copyright Beman Dawes 2003, 2006, 2011

# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

# See library home page at http://www.boost.org/libs/timer

# when run from another directory, such as boost-root/status


#     [ run /boost/tools/inspect//inspect/<variant>release
#       : $(parent) -text -brief # command line
#       : # input files
#       : <dependency>/boost/filesystem//boost_filesystem
#         <test-info>always_show_run_output # requirements
#       : inspect # test name
#     ]
bcm_test(NAME ___example_auto_cpu_timer_example SOURCES ../example/auto_cpu_timer_example.cpp)
bcm_test(NAME cpu_timer_info SOURCES cpu_timer_info.cpp)
bcm_test(NAME cpu_timer_test SOURCES cpu_timer_test.cpp)
bcm_test(NAME ___example_timex SOURCES ../example/timex.cpp ARGS echo "Hello, world")
bcm_test(NAME original_timer_test SOURCES original_timer_test.cpp COMPILE_ONLY)

