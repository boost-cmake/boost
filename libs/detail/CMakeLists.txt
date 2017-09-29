cmake_minimum_required(VERSION 3.5)
project(boost_detail)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_detail INTERFACE
)
set_property(TARGET boost_detail PROPERTY EXPORT_NAME detail)

target_link_libraries(boost_detail INTERFACE boost::core)
target_link_libraries(boost_detail INTERFACE boost::static_assert)
target_link_libraries(boost_detail INTERFACE boost::mpl)
target_link_libraries(boost_detail INTERFACE boost::type_traits)
target_link_libraries(boost_detail INTERFACE boost::preprocessor)
target_link_libraries(boost_detail INTERFACE boost::config)




bcm_deploy(TARGETS boost_detail INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
