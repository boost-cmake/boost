cmake_minimum_required(VERSION 3.5)
project(boost_date_time)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_static_assert)
find_package(boost_algorithm)
find_package(boost_tokenizer)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_io)
find_package(boost_serialization)
find_package(boost_lexical_cast)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_date_time
    src/gregorian/greg_month.cpp
    src/gregorian/greg_weekday.cpp
    src/gregorian/date_generators.cpp
)
set_property(TARGET boost_date_time PROPERTY EXPORT_NAME date_time)

target_include_directories(boost_date_time PRIVATE include)

target_link_libraries(boost_date_time PUBLIC boost::static_assert)
target_link_libraries(boost_date_time PUBLIC boost::algorithm)
target_link_libraries(boost_date_time PUBLIC boost::tokenizer)
target_link_libraries(boost_date_time PUBLIC boost::mpl)
target_link_libraries(boost_date_time PUBLIC boost::assert)
target_link_libraries(boost_date_time PUBLIC boost::range)
target_link_libraries(boost_date_time PUBLIC boost::type_traits)
target_link_libraries(boost_date_time PUBLIC boost::smart_ptr)
target_link_libraries(boost_date_time PUBLIC boost::io)
target_link_libraries(boost_date_time PUBLIC boost::serialization)
target_link_libraries(boost_date_time PUBLIC boost::lexical_cast)
target_link_libraries(boost_date_time PUBLIC boost::config)
target_link_libraries(boost_date_time PUBLIC boost::throw_exception)
target_link_libraries(boost_date_time PUBLIC boost::utility)

bcm_deploy(TARGETS boost_date_time INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
