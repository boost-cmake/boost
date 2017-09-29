cmake_minimum_required(VERSION 3.5)
project(boost_conversion)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_typeof)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_smart_ptr)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_conversion INTERFACE
)
set_property(TARGET boost_conversion PROPERTY EXPORT_NAME conversion)

target_link_libraries(boost_conversion INTERFACE boost::assert)
target_link_libraries(boost_conversion INTERFACE boost::type_traits)
target_link_libraries(boost_conversion INTERFACE boost::typeof)
target_link_libraries(boost_conversion INTERFACE boost::config)
target_link_libraries(boost_conversion INTERFACE boost::throw_exception)
target_link_libraries(boost_conversion INTERFACE boost::smart_ptr)




bcm_deploy(TARGETS boost_conversion INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
