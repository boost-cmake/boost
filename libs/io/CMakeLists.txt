cmake_minimum_required(VERSION 3.5)
project(boost_io)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_io INTERFACE
)
set_property(TARGET boost_io PROPERTY EXPORT_NAME io)

target_link_libraries(boost_io INTERFACE boost::config)




bcm_deploy(TARGETS boost_io INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
