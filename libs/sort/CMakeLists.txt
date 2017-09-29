cmake_minimum_required(VERSION 3.5)
project(boost_sort)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_type_traits)
find_package(boost_serialization)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_sort INTERFACE
)
set_property(TARGET boost_sort PROPERTY EXPORT_NAME sort)

target_link_libraries(boost_sort INTERFACE boost::core)
target_link_libraries(boost_sort INTERFACE boost::static_assert)
target_link_libraries(boost_sort INTERFACE boost::type_traits)
target_link_libraries(boost_sort INTERFACE boost::serialization)
target_link_libraries(boost_sort INTERFACE boost::config)




bcm_deploy(TARGETS boost_sort INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
