cmake_minimum_required(VERSION 3.5)
project(boost_exception)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_tuple)
find_package(boost_assert)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_exception 
src/clone_current_exception_non_intrusive.cpp
)
set_property(TARGET boost_exception PROPERTY EXPORT_NAME exception)

target_link_libraries(boost_exception PUBLIC boost::core)
target_link_libraries(boost_exception PUBLIC boost::tuple)
target_link_libraries(boost_exception PUBLIC boost::assert)
target_link_libraries(boost_exception PUBLIC boost::smart_ptr)
target_link_libraries(boost_exception PUBLIC boost::config)
target_link_libraries(boost_exception PUBLIC boost::throw_exception)



target_include_directories(boost_exception PRIVATE include)

bcm_deploy(TARGETS boost_exception INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
