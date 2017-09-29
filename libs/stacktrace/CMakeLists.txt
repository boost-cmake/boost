cmake_minimum_required(VERSION 3.5)
project(boost_stacktrace)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)


bcm_setup_version(VERSION 1.64.0)

add_library(boost_stacktrace INTERFACE
)
set_property(TARGET boost_stacktrace PROPERTY EXPORT_NAME stacktrace)





bcm_deploy(TARGETS boost_stacktrace INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
