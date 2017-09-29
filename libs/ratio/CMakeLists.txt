cmake_minimum_required(VERSION 3.5)
project(boost_ratio)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_rational)
find_package(boost_integer)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_ratio INTERFACE
)
set_property(TARGET boost_ratio PROPERTY EXPORT_NAME ratio)

target_link_libraries(boost_ratio INTERFACE boost::core)
target_link_libraries(boost_ratio INTERFACE boost::static_assert)
target_link_libraries(boost_ratio INTERFACE boost::mpl)
target_link_libraries(boost_ratio INTERFACE boost::type_traits)
target_link_libraries(boost_ratio INTERFACE boost::rational)
target_link_libraries(boost_ratio INTERFACE boost::integer)
target_link_libraries(boost_ratio INTERFACE boost::config)




bcm_deploy(TARGETS boost_ratio INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
