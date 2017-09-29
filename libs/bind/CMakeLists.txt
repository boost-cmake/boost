cmake_minimum_required(VERSION 3.5)
project(boost_bind)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_config)
find_package(boost_core)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_bind INTERFACE
)
set_property(TARGET boost_bind PROPERTY EXPORT_NAME bind)

target_link_libraries(boost_bind INTERFACE boost::config)
target_link_libraries(boost_bind INTERFACE boost::core)




bcm_deploy(TARGETS boost_bind INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
