cmake_minimum_required(VERSION 3.5)
project(boost_tti)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function_types)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_tti INTERFACE
)
set_property(TARGET boost_tti PROPERTY EXPORT_NAME tti)

target_link_libraries(boost_tti INTERFACE boost::function_types)
target_link_libraries(boost_tti INTERFACE boost::mpl)
target_link_libraries(boost_tti INTERFACE boost::type_traits)
target_link_libraries(boost_tti INTERFACE boost::preprocessor)
target_link_libraries(boost_tti INTERFACE boost::config)




bcm_deploy(TARGETS boost_tti INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
