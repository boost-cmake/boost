cmake_minimum_required(VERSION 3.5)
project(boost_numeric_conversion)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_conversion)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_numeric_conversion INTERFACE
)
set_property(TARGET boost_numeric_conversion PROPERTY EXPORT_NAME numeric_conversion)

target_link_libraries(boost_numeric_conversion INTERFACE boost::core)
target_link_libraries(boost_numeric_conversion INTERFACE boost::conversion)
target_link_libraries(boost_numeric_conversion INTERFACE boost::mpl)
target_link_libraries(boost_numeric_conversion INTERFACE boost::type_traits)
target_link_libraries(boost_numeric_conversion INTERFACE boost::preprocessor)
target_link_libraries(boost_numeric_conversion INTERFACE boost::config)
target_link_libraries(boost_numeric_conversion INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_numeric_conversion INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
