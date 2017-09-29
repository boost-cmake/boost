cmake_minimum_required(VERSION 3.5)
project(boost_vmd)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_preprocessor)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_vmd INTERFACE
)
set_property(TARGET boost_vmd PROPERTY EXPORT_NAME vmd)

target_link_libraries(boost_vmd INTERFACE boost::preprocessor)




bcm_deploy(TARGETS boost_vmd INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
