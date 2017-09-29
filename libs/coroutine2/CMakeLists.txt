cmake_minimum_required(VERSION 3.5)
project(boost_coroutine2)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_assert)
find_package(boost_fiber)
find_package(boost_config)
find_package(boost_context)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_coroutine2 INTERFACE
)
set_property(TARGET boost_coroutine2 PROPERTY EXPORT_NAME coroutine2)

target_link_libraries(boost_coroutine2 INTERFACE boost::assert)
target_link_libraries(boost_coroutine2 INTERFACE boost::fiber)
target_link_libraries(boost_coroutine2 INTERFACE boost::config)
target_link_libraries(boost_coroutine2 INTERFACE boost::context)




bcm_deploy(TARGETS boost_coroutine2 INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
