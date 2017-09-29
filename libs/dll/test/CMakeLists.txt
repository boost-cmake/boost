include(BCMTest)

find_package(boost_thread)
find_package(boost_bind)
find_package(boost_variant)
find_package(boost_fusion)

bcm_test_link_libraries(boost_dll
boost::thread
boost::bind
boost::variant
boost::fusion
)

#
# Copyright Renato Tegon Forti, Antony Polukhin 2011 - 2016.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)
#

# For more information, see http://www.boost.org

# TODO: Fix these tests, and add dynamic flag
# bcm_test(NAME shared_library_load_test SOURCES shared_library_load_test.cpp)
bcm_test(NAME shared_library_search_symbol_test SOURCES shared_library_search_symbol_test.cpp)
# bcm_test(NAME shared_library_get_symbol_test SOURCES shared_library_get_symbol_test.cpp)
# bcm_test(NAME shared_library_get_symbol_test SOURCES shared_library_get_symbol_test.cpp)
bcm_test(NAME symbol_runtime_info_test SOURCES symbol_runtime_info_test.cpp)
bcm_test(NAME shared_library_errors SOURCES shared_library_errors.cpp)
bcm_test(NAME structures_tests SOURCES structures_tests.cpp)
# bcm_test(NAME library_info_test SOURCES library_info_test.cpp)
bcm_test(NAME example_getting_started_cpp SOURCES ../example/getting_started.cpp)
# bcm_test(NAME example_tutorial1_tutorial1 SOURCES ../example/tutorial1/tutorial1.cpp)
# bcm_test(NAME example_tutorial2_tutorial2 SOURCES ../example/tutorial2/tutorial2.cpp)
# bcm_test(NAME example_tutorial3_tutorial3 SOURCES ../example/tutorial3/tutorial3.cpp)
# bcm_test(NAME example_tutorial4_load_self SOURCES ../example/tutorial4/load_self.cpp)
# bcm_test(NAME example_tutorial5_load_all SOURCES ../example/tutorial5/load_all.cpp)
# bcm_test(NAME example_tutorial6_tutorial6 SOURCES ../example/tutorial6/tutorial6.cpp)
# bcm_test(NAME example_tutorial7_tutorial7 SOURCES ../example/tutorial7/tutorial7.cpp)
# bcm_test(NAME example_tutorial8_tutorial8 SOURCES ../example/tutorial8/tutorial8.cpp)
# bcm_test(NAME example_tutorial8_tutorial8_static SOURCES ../example/tutorial8/tutorial8_static.cpp)
bcm_test(NAME example_tutorial9_tutorial9 SOURCES ../example/tutorial9/tutorial9.cpp)
bcm_test(NAME section_name_too_big SOURCES section_name_too_big.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME shared_library_concurrent_load_test SOURCES shared_library_concurrent_load_test.cpp)
bcm_test(NAME cpp_mangle_test SOURCES cpp_mangle_test.cpp)
bcm_test(NAME cpp_load_test SOURCES cpp_load_test.cpp)
bcm_test(NAME cpp_import_test SOURCES cpp_import_test.cpp)
bcm_test(NAME cpp_import_class_test SOURCES cpp_import_class_test.cpp)

