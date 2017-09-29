cmake_minimum_required(VERSION 3.5)
project(boost_typeof)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_typeof INTERFACE
)
set_property(TARGET boost_typeof PROPERTY EXPORT_NAME typeof)

target_link_libraries(boost_typeof INTERFACE boost::core)
target_link_libraries(boost_typeof INTERFACE boost::mpl)
target_link_libraries(boost_typeof INTERFACE boost::type_traits)
target_link_libraries(boost_typeof INTERFACE boost::preprocessor)
target_link_libraries(boost_typeof INTERFACE boost::config)




bcm_deploy(TARGETS boost_typeof INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
