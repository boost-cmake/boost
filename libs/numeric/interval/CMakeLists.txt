cmake_minimum_required(VERSION 3.5)
project(boost_numeric_interval)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_logic)
find_package(boost_config)
find_package(boost_detail)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_numeric_interval INTERFACE
)
set_property(TARGET boost_numeric_interval PROPERTY EXPORT_NAME numeric_interval)

target_link_libraries(boost_numeric_interval INTERFACE boost::logic)
target_link_libraries(boost_numeric_interval INTERFACE boost::config)
target_link_libraries(boost_numeric_interval INTERFACE boost::detail)




bcm_deploy(TARGETS boost_numeric_interval INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
