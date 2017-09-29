include(BCMTest)

find_package(boost_core)
find_package(boost_random)
find_package(boost_smart_ptr)
find_package(boost_serialization)

bcm_test_link_libraries(boost_pool
boost::core
boost::random
boost::smart_ptr
boost::serialization
)

#~ Copyright Rene Rivera 2008
#~ Distributed under the Boost Software License, Version 1.0.
#~ (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


# <toolset>gcc:<warnings-as-errors>on
# <toolset>msvc:<warnings-as-errors>on


bcm_test(NAME valgrind_config_check SOURCES valgrind_config_check.cpp)




#
# The following tests test Boost.Pool's code with valgrind only if it's available:
#

#
# The following tests test Boost.Pool's code with valgrind if it's available, and in any case with BOOST_POOL_VALGRIND defined
# which has the effect of disabling any actual memory pooling:
#
bcm_test(NAME test_simple_seg_storage SOURCES test_simple_seg_storage.cpp)
bcm_test(NAME test_pool_alloc SOURCES test_pool_alloc.cpp)
bcm_test(NAME pool_msvc_compiler_bug_test SOURCES pool_msvc_compiler_bug_test.cpp)
bcm_test(NAME test_msvc_mem_leak_detect SOURCES test_msvc_mem_leak_detect.cpp)
bcm_test(NAME test_bug_3349 SOURCES test_bug_3349.cpp)
bcm_test(NAME test_bug_4960 SOURCES test_bug_4960.cpp)
bcm_test(NAME test_bug_1252 SOURCES test_bug_1252.cpp)
bcm_test(NAME test_bug_2696 SOURCES test_bug_2696.cpp)
bcm_test(NAME test_bug_5526 SOURCES test_bug_5526.cpp)
bcm_test(NAME test_threading SOURCES test_threading.cpp)
bcm_test(NAME ___example_time_pool_alloc SOURCES ../example/time_pool_alloc.cpp)
bcm_test(NAME test_poisoned_macros SOURCES test_poisoned_macros.cpp COMPILE_ONLY)
bcm_test(NAME test_simple_seg_storage_valgrind SOURCES test_simple_seg_storage.cpp)
bcm_test(NAME test_pool_alloc_valgrind SOURCES test_pool_alloc.cpp)
bcm_test(NAME pool_msvc_compiler_bug_test_valgrind SOURCES pool_msvc_compiler_bug_test.cpp)
bcm_test(NAME test_msvc_mem_leak_detect_valgrind SOURCES test_msvc_mem_leak_detect.cpp)
bcm_test(NAME test_bug_3349_valgrind SOURCES test_bug_3349.cpp)
bcm_test(NAME test_bug_4960_valgrind SOURCES test_bug_4960.cpp)
bcm_test(NAME test_bug_1252_valgrind SOURCES test_bug_1252.cpp)
bcm_test(NAME test_bug_2696_valgrind SOURCES test_bug_2696.cpp)
bcm_test(NAME test_bug_5526_valgrind SOURCES test_bug_5526.cpp)
bcm_test(NAME test_threading_valgrind SOURCES test_threading.cpp)
bcm_test(NAME test_simple_seg_storage_valgrind_2 SOURCES test_simple_seg_storage.cpp)
target_compile_definitions(test_simple_seg_storage_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
bcm_test(NAME test_pool_alloc_valgrind_2 SOURCES test_pool_alloc.cpp)
target_compile_definitions(test_pool_alloc_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
bcm_test(NAME pool_msvc_compiler_bug_test_valgrind_2 SOURCES pool_msvc_compiler_bug_test.cpp)
target_compile_definitions(pool_msvc_compiler_bug_test_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
bcm_test(NAME test_msvc_mem_leak_detect_valgrind_2 SOURCES test_msvc_mem_leak_detect.cpp)
target_compile_definitions(test_msvc_mem_leak_detect_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
bcm_test(NAME test_bug_3349_valgrind_2 SOURCES test_bug_3349.cpp)
target_compile_definitions(test_bug_3349_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
bcm_test(NAME test_bug_4960_valgrind_2 SOURCES test_bug_4960.cpp)
target_compile_definitions(test_bug_4960_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
bcm_test(NAME test_bug_1252_valgrind_2 SOURCES test_bug_1252.cpp)
target_compile_definitions(test_bug_1252_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
bcm_test(NAME test_bug_2696_valgrind_2 SOURCES test_bug_2696.cpp)
target_compile_definitions(test_bug_2696_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
bcm_test(NAME test_bug_5526_valgrind_2 SOURCES test_bug_5526.cpp)
target_compile_definitions(test_bug_5526_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
bcm_test(NAME test_threading_valgrind_2 SOURCES test_threading.cpp)
target_compile_definitions(test_threading_valgrind_2 PUBLIC BOOST_POOL_VALGRIND=1)
# bcm_test(NAME test_valgrind_fail_1 SOURCES test_valgrind_fail_1.cpp WILL_FAIL)
# target_compile_definitions(test_valgrind_fail_1 PUBLIC BOOST_POOL_VALGRIND=1)
# bcm_test(NAME test_valgrind_fail_2 SOURCES test_valgrind_fail_2.cpp WILL_FAIL)
# target_compile_definitions(test_valgrind_fail_2 PUBLIC BOOST_POOL_VALGRIND=1)



