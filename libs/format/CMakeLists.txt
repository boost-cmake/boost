cmake_minimum_required(VERSION 3.5)
project(boost_format)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_config)
find_package(boost_assert)
find_package(boost_smart_ptr)
find_package(boost_optional)
find_package(boost_throw_exception)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_format INTERFACE
)
set_property(TARGET boost_format PROPERTY EXPORT_NAME format)

target_link_libraries(boost_format INTERFACE boost::config)
target_link_libraries(boost_format INTERFACE boost::assert)
target_link_libraries(boost_format INTERFACE boost::smart_ptr)
target_link_libraries(boost_format INTERFACE boost::optional)
target_link_libraries(boost_format INTERFACE boost::throw_exception)
target_link_libraries(boost_format INTERFACE boost::utility)




bcm_deploy(TARGETS boost_format INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
