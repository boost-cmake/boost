cmake_minimum_required(VERSION 3.5)
project(boost_tuple)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_type_traits)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_tuple INTERFACE
)
set_property(TARGET boost_tuple PROPERTY EXPORT_NAME tuple)

target_link_libraries(boost_tuple INTERFACE boost::core)
target_link_libraries(boost_tuple INTERFACE boost::static_assert)
target_link_libraries(boost_tuple INTERFACE boost::type_traits)
target_link_libraries(boost_tuple INTERFACE boost::config)




bcm_deploy(TARGETS boost_tuple INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
