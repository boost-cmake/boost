cmake_minimum_required(VERSION 3.5)
project(boost_polygon)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_mpl)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_polygon INTERFACE
)
set_property(TARGET boost_polygon PROPERTY EXPORT_NAME polygon)

target_link_libraries(boost_polygon INTERFACE boost::core)
target_link_libraries(boost_polygon INTERFACE boost::mpl)
target_link_libraries(boost_polygon INTERFACE boost::config)




bcm_deploy(TARGETS boost_polygon INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
