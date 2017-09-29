cmake_minimum_required(VERSION 3.5)
project(boost_system)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_assert)
find_package(boost_core)
find_package(boost_config)
find_package(boost_predef)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_system 
src/error_code.cpp
)
set_property(TARGET boost_system PROPERTY EXPORT_NAME system)

target_link_libraries(boost_system PUBLIC boost::assert)
target_link_libraries(boost_system PUBLIC boost::core)
target_link_libraries(boost_system PUBLIC boost::config)
target_link_libraries(boost_system PUBLIC boost::predef)



target_include_directories(boost_system PRIVATE include)

bcm_deploy(TARGETS boost_system INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
