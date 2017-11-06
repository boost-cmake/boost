cmake_minimum_required(VERSION 3.5)
project(boost_mp11)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)


bcm_setup_version(VERSION 1.64.0)

add_library(boost_mp11 INTERFACE
)
set_property(TARGET boost_mp11 PROPERTY EXPORT_NAME mp11)





bcm_deploy(TARGETS boost_mp11 INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
