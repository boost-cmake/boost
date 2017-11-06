cmake_minimum_required(VERSION 3.5)
project(boost_type_traits)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_type_traits INTERFACE
)
set_property(TARGET boost_type_traits PROPERTY EXPORT_NAME type_traits)

target_link_libraries(boost_type_traits INTERFACE boost::core)
target_link_libraries(boost_type_traits INTERFACE boost::static_assert)
target_link_libraries(boost_type_traits INTERFACE boost::config)




bcm_deploy(TARGETS boost_type_traits INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
