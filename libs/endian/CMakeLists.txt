cmake_minimum_required(VERSION 3.5)
project(boost_endian)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_system)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_config)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_endian INTERFACE
)
set_property(TARGET boost_endian PROPERTY EXPORT_NAME endian)

target_link_libraries(boost_endian INTERFACE boost::core)
target_link_libraries(boost_endian INTERFACE boost::static_assert)
target_link_libraries(boost_endian INTERFACE boost::predef)
target_link_libraries(boost_endian INTERFACE boost::system)
target_link_libraries(boost_endian INTERFACE boost::assert)
target_link_libraries(boost_endian INTERFACE boost::type_traits)
target_link_libraries(boost_endian INTERFACE boost::config)
target_link_libraries(boost_endian INTERFACE boost::utility)




bcm_deploy(TARGETS boost_endian INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
