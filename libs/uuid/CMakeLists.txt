cmake_minimum_required(VERSION 3.5)
project(boost_uuid)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_winapi)
find_package(boost_random)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_io)
find_package(boost_serialization)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_uuid INTERFACE
)
set_property(TARGET boost_uuid PROPERTY EXPORT_NAME uuid)

target_link_libraries(boost_uuid INTERFACE boost::core)
target_link_libraries(boost_uuid INTERFACE boost::static_assert)
target_link_libraries(boost_uuid INTERFACE boost::iterator)
target_link_libraries(boost_uuid INTERFACE boost::winapi)
target_link_libraries(boost_uuid INTERFACE boost::random)
target_link_libraries(boost_uuid INTERFACE boost::assert)
target_link_libraries(boost_uuid INTERFACE boost::type_traits)
target_link_libraries(boost_uuid INTERFACE boost::smart_ptr)
target_link_libraries(boost_uuid INTERFACE boost::io)
target_link_libraries(boost_uuid INTERFACE boost::serialization)
target_link_libraries(boost_uuid INTERFACE boost::config)
target_link_libraries(boost_uuid INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_uuid INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
