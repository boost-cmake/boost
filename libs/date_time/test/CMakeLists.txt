include(BCMTest)


bcm_test_link_libraries(boost_date_time
)



add_library(data_time_tests_properties INTERFACE)
target_compile_definitions(data_time_tests_properties INTERFACE BOOST_DATE_TIME_POSIX_TIME_STD_CONFIG)
bcm_test_link_libraries(data_time_tests_properties)

bcm_test(NAME testint_adapter SOURCES testint_adapter.cpp)
bcm_test(NAME testtime_resolution_traits SOURCES testtime_resolution_traits.cpp)
bcm_test(NAME testwrapping_int SOURCES testwrapping_int.cpp)
bcm_test(NAME testconstrained_value SOURCES testconstrained_value.cpp)
bcm_test(NAME testgregorian_calendar SOURCES testgregorian_calendar.cpp)
bcm_test(NAME testgeneric_period SOURCES testgeneric_period.cpp)

bcm_test(NAME gregorian_testdate SOURCES gregorian/testdate.cpp)
bcm_test(NAME gregorian_testdate_duration SOURCES gregorian/testdate_duration.cpp)
bcm_test(NAME gregorian_testgreg_durations SOURCES gregorian/testgreg_durations.cpp)
bcm_test(NAME gregorian_testperiod SOURCES gregorian/testperiod.cpp)
bcm_test(NAME gregorian_testdate_iterator SOURCES gregorian/testdate_iterator.cpp)
bcm_test(NAME gregorian_testformatters SOURCES gregorian/testformatters.cpp)
###  streaming
bcm_test(NAME gregorian_testdate_facet_new SOURCES gregorian/testdate_facet_new.cpp)
bcm_test(NAME gregorian_testdate_input_facet SOURCES gregorian/testdate_input_facet.cpp)
###
bcm_test(NAME gregorian_testgenerators SOURCES gregorian/testgenerators.cpp)
bcm_test(NAME gregorian_testgreg_cal SOURCES gregorian/testgreg_cal.cpp)
bcm_test(NAME gregorian_testgreg_day SOURCES gregorian/testgreg_day.cpp)
bcm_test(NAME gregorian_testgreg_month SOURCES gregorian/testgreg_month.cpp)
bcm_test(NAME gregorian_testgreg_year SOURCES gregorian/testgreg_year.cpp)
bcm_test(NAME testdate_dll SOURCES gregorian/testdate.cpp)
bcm_test(NAME testdate_duration_dll SOURCES gregorian/testdate_duration.cpp)
bcm_test(NAME testperiod_dll SOURCES gregorian/testperiod.cpp)
bcm_test(NAME testdate_iterator_dll SOURCES gregorian/testdate_iterator.cpp)
bcm_test(NAME testformatters_dll SOURCES gregorian/testformatters.cpp)
###  streaming
bcm_test(NAME testdate_facet_new_dll SOURCES gregorian/testdate_facet_new.cpp)
bcm_test(NAME testdate_input_facet_dll SOURCES gregorian/testdate_input_facet.cpp)
###
bcm_test(NAME testgenerators_dll SOURCES gregorian/testgenerators.cpp)
bcm_test(NAME testgreg_cal_dll SOURCES gregorian/testgreg_cal.cpp)
bcm_test(NAME testgreg_day_dll SOURCES gregorian/testgreg_day.cpp)
bcm_test(NAME testgreg_month_dll SOURCES gregorian/testgreg_month.cpp)
bcm_test(NAME testgreg_year_dll SOURCES gregorian/testgreg_year.cpp)
bcm_test(NAME testgreg_durations_dll SOURCES gregorian/testgreg_durations.cpp)

bcm_test(NAME posix_time_testfiletime_functions SOURCES posix_time/testfiletime_functions.cpp)
bcm_test(NAME posix_time_testlocal_adjustor SOURCES posix_time/testlocal_adjustor.cpp)
bcm_test(NAME posix_time_testc_local_adjustor SOURCES posix_time/testc_local_adjustor.cpp)
bcm_test(NAME posix_time_testclock SOURCES posix_time/testclock.cpp)
bcm_test(NAME posix_time_testdst_rules SOURCES posix_time/testdst_rules.cpp)
bcm_test(NAME posix_time_testduration SOURCES posix_time/testduration.cpp)
bcm_test(NAME posix_time_testiterator SOURCES posix_time/testiterator.cpp)
bcm_test(NAME posix_time_testparse_time SOURCES posix_time/testparse_time.cpp)
bcm_test(NAME posix_time_testtime_period SOURCES posix_time/testtime_period.cpp)
bcm_test(NAME posix_time_testtime SOURCES posix_time/testtime.cpp)
bcm_test(NAME posix_time_testmicrosec_time_clock SOURCES posix_time/testmicrosec_time_clock.cpp)
bcm_test(NAME posix_time_testtime_formatters SOURCES posix_time/testtime_formatters.cpp)
bcm_test(NAME posix_time_testgreg_duration_operators SOURCES posix_time/testgreg_duration_operators.cpp)
### streaming
bcm_test(NAME posix_time_testtime_facet SOURCES posix_time/testtime_facet.cpp)
bcm_test(NAME posix_time_testtime_input_facet SOURCES posix_time/testtime_input_facet.cpp)
###



bcm_test(NAME gregorian_testgreg_wstream SOURCES gregorian/testgreg_wstream.cpp)
target_compile_definitions(gregorian_testgreg_wstream PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)
bcm_test(NAME posix_time_testtime_wstream SOURCES posix_time/testtime_wstream.cpp)
target_compile_definitions(posix_time_testtime_wstream PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)

bcm_test(NAME testfacet_dll SOURCES gregorian/testfacet.cpp)
target_compile_definitions(testfacet_dll PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)
#  [ run gregorian/testparse_date.cpp ../build//boost_date_time : : : $(DATE_TIME_DYNAMIC_PROPERTIES)  <define>USE_DATE_TIME_PRE_1_33_FACET_IO : testparse_date_dll ]
bcm_test(NAME gregorian_testfacet SOURCES gregorian/testfacet.cpp)
target_compile_definitions(gregorian_testfacet PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)
bcm_test(NAME gregorian_testparse_date SOURCES gregorian/testparse_date.cpp)
target_compile_definitions(gregorian_testparse_date PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)

bcm_test(NAME posix_time_teststreams SOURCES posix_time/teststreams.cpp)
target_compile_definitions(posix_time_teststreams PUBLIC USE_DATE_TIME_PRE_1_33_FACET_IO)


bcm_test(NAME local_time_testdst_transition_day_rule SOURCES local_time/testdst_transition_day_rule.cpp)
bcm_test(NAME local_time_testcustom_time_zone SOURCES local_time/testcustom_time_zone.cpp)
bcm_test(NAME local_time_testposix_time_zone SOURCES local_time/testposix_time_zone.cpp)
bcm_test(NAME local_time_testwcustom_time_zone SOURCES local_time/testwcustom_time_zone.cpp)
bcm_test(NAME local_time_testwposix_time_zone SOURCES local_time/testwposix_time_zone.cpp)
bcm_test(NAME local_time_testtz_database SOURCES local_time/testtz_database.cpp)
bcm_test(NAME local_time_testlocal_time SOURCES local_time/testlocal_time.cpp)
bcm_test(NAME local_time_testlocal_time_iterator SOURCES local_time/testlocal_time_iterator.cpp)
bcm_test(NAME local_time_testlocal_time_period SOURCES local_time/testlocal_time_period.cpp)
### streaming
bcm_test(NAME local_time_testlocal_time_facet SOURCES local_time/testlocal_time_facet.cpp)
bcm_test(NAME local_time_testlocal_time_input_facet SOURCES local_time/testlocal_time_input_facet.cpp)
###
bcm_test(NAME local_time_testclocks SOURCES local_time/testclocks.cpp)


bcm_test(NAME testgreg_serialize_xml SOURCES gregorian/testgreg_serialize.cpp)
target_compile_definitions(testgreg_serialize_xml PUBLIC DATE_TIME_XML_SERIALIZE)
bcm_test(NAME testtime_serialize_xml_std_config SOURCES posix_time/testtime_serialize.cpp)
target_compile_definitions(testtime_serialize_xml_std_config PUBLIC DATE_TIME_XML_SERIALIZE BOOST_DATE_TIME_POSIX_TIME_STD_CONFIG)
bcm_test(NAME posix_time_testtime_serialize_xml SOURCES posix_time/testtime_serialize.cpp)
target_compile_definitions(posix_time_testtime_serialize_xml PUBLIC DATE_TIME_XML_SERIALIZE)

bcm_test(NAME gregorian_testgreg_serialize SOURCES gregorian/testgreg_serialize.cpp)
bcm_test(NAME posix_time_testtime_serialize SOURCES posix_time/testtime_serialize.cpp)


# Copyright (c) 2000-2005
# CrystalClear Software, Inc.
# Subject to the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or
# http://www.boost.org/LICENSE_1_0.txt)





