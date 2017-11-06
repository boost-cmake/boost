cmake_minimum_required(VERSION 3.5)
project(boost_qvm)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_exception)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_assert)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_qvm INTERFACE
)
set_property(TARGET boost_qvm PROPERTY EXPORT_NAME qvm)

target_link_libraries(boost_qvm INTERFACE boost::exception)
target_link_libraries(boost_qvm INTERFACE boost::core)
target_link_libraries(boost_qvm INTERFACE boost::static_assert)
target_link_libraries(boost_qvm INTERFACE boost::assert)
target_link_libraries(boost_qvm INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_qvm INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
