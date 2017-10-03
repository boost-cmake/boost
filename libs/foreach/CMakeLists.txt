cmake_minimum_required(VERSION 3.5)
project(boost_foreach)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_foreach INTERFACE
)
set_property(TARGET boost_foreach PROPERTY EXPORT_NAME foreach)

target_link_libraries(boost_foreach INTERFACE boost::core)
target_link_libraries(boost_foreach INTERFACE boost::iterator)
target_link_libraries(boost_foreach INTERFACE boost::mpl)
target_link_libraries(boost_foreach INTERFACE boost::range)
target_link_libraries(boost_foreach INTERFACE boost::type_traits)
target_link_libraries(boost_foreach INTERFACE boost::config)




bcm_deploy(TARGETS boost_foreach INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
