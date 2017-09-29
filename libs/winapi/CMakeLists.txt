cmake_minimum_required(VERSION 3.5)
project(boost_winapi)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_config)
find_package(boost_predef)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_winapi INTERFACE
)
set_property(TARGET boost_winapi PROPERTY EXPORT_NAME winapi)

target_link_libraries(boost_winapi INTERFACE boost::config)
target_link_libraries(boost_winapi INTERFACE boost::predef)




bcm_deploy(TARGETS boost_winapi INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
