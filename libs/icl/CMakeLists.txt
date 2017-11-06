cmake_minimum_required(VERSION 3.5)
project(boost_icl)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_date_time)
find_package(boost_container)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_rational)
find_package(boost_config)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_icl INTERFACE
)
set_property(TARGET boost_icl PROPERTY EXPORT_NAME icl)

target_link_libraries(boost_icl INTERFACE boost::core)
target_link_libraries(boost_icl INTERFACE boost::static_assert)
target_link_libraries(boost_icl INTERFACE boost::date_time)
target_link_libraries(boost_icl INTERFACE boost::container)
target_link_libraries(boost_icl INTERFACE boost::iterator)
target_link_libraries(boost_icl INTERFACE boost::mpl)
target_link_libraries(boost_icl INTERFACE boost::move)
target_link_libraries(boost_icl INTERFACE boost::detail)
target_link_libraries(boost_icl INTERFACE boost::assert)
target_link_libraries(boost_icl INTERFACE boost::type_traits)
target_link_libraries(boost_icl INTERFACE boost::concept_check)
target_link_libraries(boost_icl INTERFACE boost::rational)
target_link_libraries(boost_icl INTERFACE boost::config)
target_link_libraries(boost_icl INTERFACE boost::utility)




bcm_deploy(TARGETS boost_icl INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
