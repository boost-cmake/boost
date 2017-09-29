cmake_minimum_required(VERSION 3.5)
project(boost_crc)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_integer)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_crc INTERFACE
)
set_property(TARGET boost_crc PROPERTY EXPORT_NAME crc)

target_link_libraries(boost_crc INTERFACE boost::integer)
target_link_libraries(boost_crc INTERFACE boost::config)




bcm_deploy(TARGETS boost_crc INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
