cmake_minimum_required(VERSION 3.5)
project(boost_numeric_ublas)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_static_assert)
find_package(boost_numeric_interval)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_typeof)
find_package(boost_serialization)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_smart_ptr)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_numeric_ublas INTERFACE
)
set_property(TARGET boost_numeric_ublas PROPERTY EXPORT_NAME numeric_ublas)

target_link_libraries(boost_numeric_ublas INTERFACE boost::core)
target_link_libraries(boost_numeric_ublas INTERFACE boost::iterator)
target_link_libraries(boost_numeric_ublas INTERFACE boost::mpl)
target_link_libraries(boost_numeric_ublas INTERFACE boost::static_assert)
target_link_libraries(boost_numeric_ublas INTERFACE boost::numeric_interval)
target_link_libraries(boost_numeric_ublas INTERFACE boost::range)
target_link_libraries(boost_numeric_ublas INTERFACE boost::type_traits)
target_link_libraries(boost_numeric_ublas INTERFACE boost::concept_check)
target_link_libraries(boost_numeric_ublas INTERFACE boost::typeof)
target_link_libraries(boost_numeric_ublas INTERFACE boost::serialization)
target_link_libraries(boost_numeric_ublas INTERFACE boost::utility)
target_link_libraries(boost_numeric_ublas INTERFACE boost::config)
target_link_libraries(boost_numeric_ublas INTERFACE boost::smart_ptr)




bcm_deploy(TARGETS boost_numeric_ublas INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
