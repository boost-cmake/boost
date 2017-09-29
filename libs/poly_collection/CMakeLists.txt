cmake_minimum_required(VERSION 3.5)
project(boost_poly_collection)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)


bcm_setup_version(VERSION 1.64.0)

add_library(boost_poly_collection INTERFACE
)
set_property(TARGET boost_poly_collection PROPERTY EXPORT_NAME poly_collection)





bcm_deploy(TARGETS boost_poly_collection INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
