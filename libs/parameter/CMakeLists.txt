cmake_minimum_required(VERSION 3.5)
project(boost_parameter)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_python)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_type_traits)
find_package(boost_optional)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_parameter INTERFACE
)
set_property(TARGET boost_parameter PROPERTY EXPORT_NAME parameter)

target_link_libraries(boost_parameter INTERFACE boost::core)
target_link_libraries(boost_parameter INTERFACE boost::python)
target_link_libraries(boost_parameter INTERFACE boost::mpl)
target_link_libraries(boost_parameter INTERFACE boost::detail)
target_link_libraries(boost_parameter INTERFACE boost::type_traits)
target_link_libraries(boost_parameter INTERFACE boost::optional)
target_link_libraries(boost_parameter INTERFACE boost::preprocessor)
target_link_libraries(boost_parameter INTERFACE boost::config)
target_link_libraries(boost_parameter INTERFACE boost::utility)




bcm_deploy(TARGETS boost_parameter INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
