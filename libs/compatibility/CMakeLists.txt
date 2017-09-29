cmake_minimum_required(VERSION 3.5)
project(boost_compatibility)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)


bcm_setup_version(VERSION 1.64.0)

add_library(boost_compatibility INTERFACE
)
set_property(TARGET boost_compatibility PROPERTY EXPORT_NAME compatibility)





bcm_deploy(TARGETS boost_compatibility INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
