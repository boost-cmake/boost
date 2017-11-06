cmake_minimum_required(VERSION 3.5)
project(boost_beast)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)


bcm_setup_version(VERSION 1.64.0)

add_library(boost_beast INTERFACE
)
set_property(TARGET boost_beast PROPERTY EXPORT_NAME beast)





bcm_deploy(TARGETS boost_beast INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
