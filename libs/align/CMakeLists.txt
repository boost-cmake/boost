cmake_minimum_required(VERSION 3.5)
project(boost_align)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_assert)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_align INTERFACE
)
set_property(TARGET boost_align PROPERTY EXPORT_NAME align)

target_link_libraries(boost_align INTERFACE boost::core)
target_link_libraries(boost_align INTERFACE boost::static_assert)
target_link_libraries(boost_align INTERFACE boost::assert)
target_link_libraries(boost_align INTERFACE boost::config)
target_link_libraries(boost_align INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_align INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
