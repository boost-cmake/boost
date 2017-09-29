cmake_minimum_required(VERSION 3.5)
project(boost_static_assert)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_static_assert INTERFACE
)
set_property(TARGET boost_static_assert PROPERTY EXPORT_NAME static_assert)

target_link_libraries(boost_static_assert INTERFACE boost::config)




bcm_deploy(TARGETS boost_static_assert INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
