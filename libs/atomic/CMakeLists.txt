cmake_minimum_required(VERSION 3.5)
project(boost_atomic)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_atomic 
src/lockpool.cpp
)
set_property(TARGET boost_atomic PROPERTY EXPORT_NAME atomic)

target_link_libraries(boost_atomic PUBLIC boost::assert)
target_link_libraries(boost_atomic PUBLIC boost::type_traits)
target_link_libraries(boost_atomic PUBLIC boost::config)



target_include_directories(boost_atomic PRIVATE include)

bcm_deploy(TARGETS boost_atomic INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
