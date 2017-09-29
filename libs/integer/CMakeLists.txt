cmake_minimum_required(VERSION 3.5)
project(boost_integer)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_static_assert)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_integer INTERFACE
)
set_property(TARGET boost_integer PROPERTY EXPORT_NAME integer)

target_link_libraries(boost_integer INTERFACE boost::static_assert)
target_link_libraries(boost_integer INTERFACE boost::config)




bcm_deploy(TARGETS boost_integer INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
