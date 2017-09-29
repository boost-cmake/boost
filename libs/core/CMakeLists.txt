cmake_minimum_required(VERSION 3.5)
project(boost_core)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_assert)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_core INTERFACE
)
set_property(TARGET boost_core PROPERTY EXPORT_NAME core)

target_link_libraries(boost_core INTERFACE boost::assert)
target_link_libraries(boost_core INTERFACE boost::config)




bcm_deploy(TARGETS boost_core INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
