cmake_minimum_required(VERSION 3.5)
project(boost_lambda)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_utility)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_lambda INTERFACE
)
set_property(TARGET boost_lambda PROPERTY EXPORT_NAME lambda)

target_link_libraries(boost_lambda INTERFACE boost::core)
target_link_libraries(boost_lambda INTERFACE boost::iterator)
target_link_libraries(boost_lambda INTERFACE boost::tuple)
target_link_libraries(boost_lambda INTERFACE boost::bind)
target_link_libraries(boost_lambda INTERFACE boost::mpl)
target_link_libraries(boost_lambda INTERFACE boost::detail)
target_link_libraries(boost_lambda INTERFACE boost::type_traits)
target_link_libraries(boost_lambda INTERFACE boost::preprocessor)
target_link_libraries(boost_lambda INTERFACE boost::utility)
target_link_libraries(boost_lambda INTERFACE boost::config)




bcm_deploy(TARGETS boost_lambda INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
