cmake_minimum_required(VERSION 3.5)
project(boost_hana)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_tuple)
find_package(boost_mpl)
find_package(boost_fusion)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_hana INTERFACE
)
set_property(TARGET boost_hana PROPERTY EXPORT_NAME hana)

target_link_libraries(boost_hana INTERFACE boost::core)
target_link_libraries(boost_hana INTERFACE boost::tuple)
target_link_libraries(boost_hana INTERFACE boost::mpl)
target_link_libraries(boost_hana INTERFACE boost::fusion)
target_link_libraries(boost_hana INTERFACE boost::config)




bcm_deploy(TARGETS boost_hana INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
