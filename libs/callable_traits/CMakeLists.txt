cmake_minimum_required(VERSION 3.5)
project(boost_callable_traits)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)


bcm_setup_version(VERSION 1.64.0)

add_library(boost_callable_traits INTERFACE
)
set_property(TARGET boost_callable_traits PROPERTY EXPORT_NAME callable_traits)





bcm_deploy(TARGETS boost_callable_traits INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
