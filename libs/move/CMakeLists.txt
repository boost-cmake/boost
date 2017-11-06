cmake_minimum_required(VERSION 3.5)
project(boost_move)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_assert)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_move INTERFACE
)
set_property(TARGET boost_move PROPERTY EXPORT_NAME move)

target_link_libraries(boost_move INTERFACE boost::assert)
target_link_libraries(boost_move INTERFACE boost::core)
target_link_libraries(boost_move INTERFACE boost::static_assert)
target_link_libraries(boost_move INTERFACE boost::config)




bcm_deploy(TARGETS boost_move INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
