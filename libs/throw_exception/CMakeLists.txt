cmake_minimum_required(VERSION 3.5)
project(boost_throw_exception)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_assert)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_throw_exception INTERFACE
)
set_property(TARGET boost_throw_exception PROPERTY EXPORT_NAME throw_exception)

target_link_libraries(boost_throw_exception INTERFACE boost::assert)
target_link_libraries(boost_throw_exception INTERFACE boost::config)




bcm_deploy(TARGETS boost_throw_exception INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
