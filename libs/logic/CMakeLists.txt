cmake_minimum_required(VERSION 3.5)
project(boost_logic)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_logic INTERFACE
)
set_property(TARGET boost_logic PROPERTY EXPORT_NAME logic)

target_link_libraries(boost_logic INTERFACE boost::core)
target_link_libraries(boost_logic INTERFACE boost::config)




bcm_deploy(TARGETS boost_logic INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
