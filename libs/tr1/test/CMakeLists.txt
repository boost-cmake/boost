include(BCMTest)

find_package(boost_test)
find_package(boost_concept_check)
find_package(boost_program_options)

bcm_test_link_libraries(boost_tr1
boost::test
boost::concept_check
boost::program_options
)

# Copyright John Maddock 2005.
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0. (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)


# Borland's broken include mechanism needs these extra headers:
# Sunpro's broken include mechanism needs these extra headers:


#
# define the sources which need testing, mostly this is just
# all the files *_test.cpp, but any badly named examples can
# be added to this list :-)
#

# this rule enumerates through all the sources and invokes
# the run rule for each source, the result is a list of all
# the run rules, which we can pass on to the test_suite rule:
#ECHO executing test_all rule ;

file(GLOB TEST_FILES test*.cpp)
foreach(FILEB ${TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    bcm_test(NAME tr1-${NAME} SOURCES ${FILEB} COMPILE_ONLY)
    bcm_test(NAME tr1-std_${NAME} SOURCES ${FILEB} COMPILE_ONLY)
    target_compile_definitions(tr1-std_${NAME} PUBLIC TEST_STD_HEADERS=1)
endforeach()

# TODO: Fix these tests
# file(GLOB RUN_TEST_FILES run*.cpp)
# foreach(FILEB ${RUN_TEST_FILES})
#     get_filename_component(NAME ${FILEB} NAME_WE)
#     bcm_test(NAME tr1-${NAME} SOURCES ${FILEB})
#     bcm_test(NAME tr1-std_${NAME} SOURCES ${FILEB})
#     target_compile_definitions(tr1-std_${NAME} PUBLIC TEST_STD_HEADERS=1)
# endforeach()

file(GLOB CONFIG_COMPILE_FAIL_TEST_FILES config/tr1_has_tr1*fail.cpp)
foreach(FILEB ${CONFIG_COMPILE_FAIL_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    bcm_test(NAME tr1-${NAME} SOURCES ${FILEB} COMPILE_ONLY WILL_FAIL)
endforeach()

file(GLOB CONFIG_COMPILE_TEST_FILES config/tr1_has_tr1*pass.cpp)
foreach(FILEB ${CONFIG_COMPILE_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    bcm_test(NAME tr1-${NAME} SOURCES ${FILEB} COMPILE_ONLY)
endforeach()

file(GLOB STD_HEADERS_COMPILE_TEST_FILES std_headers/*.cpp)
foreach(FILEB ${STD_HEADERS_COMPILE_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    bcm_test(NAME tr1-${NAME}_std_header SOURCES ${FILEB} COMPILE_ONLY)
    target_compile_definitions(tr1-${NAME}_std_header PUBLIC TEST_STD=2005)
endforeach()

file(GLOB CYCLE_DEPEND_COMPILE_TEST_FILES cyclic_depend/*.cpp)
foreach(FILEB ${CYCLE_DEPEND_COMPILE_TEST_FILES})
    get_filename_component(NAME ${FILEB} NAME_WE)
    bcm_test(NAME tr1-${NAME} SOURCES ${FILEB} COMPILE_ONLY)
endforeach()


