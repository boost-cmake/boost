cmake_minimum_required(VERSION 3.5)
project(boost_dynamic_bitset)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_move)
find_package(boost_serialization)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_dynamic_bitset INTERFACE
)
set_property(TARGET boost_dynamic_bitset PROPERTY EXPORT_NAME dynamic_bitset)

target_link_libraries(boost_dynamic_bitset INTERFACE boost::core)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::static_assert)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::move)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::serialization)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::integer)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::config)
target_link_libraries(boost_dynamic_bitset INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_dynamic_bitset INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
