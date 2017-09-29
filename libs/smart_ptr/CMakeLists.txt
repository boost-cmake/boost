cmake_minimum_required(VERSION 3.5)
project(boost_smart_ptr)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_move)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_smart_ptr INTERFACE
)
set_property(TARGET boost_smart_ptr PROPERTY EXPORT_NAME smart_ptr)

target_link_libraries(boost_smart_ptr INTERFACE boost::core)
target_link_libraries(boost_smart_ptr INTERFACE boost::static_assert)
target_link_libraries(boost_smart_ptr INTERFACE boost::predef)
target_link_libraries(boost_smart_ptr INTERFACE boost::move)
target_link_libraries(boost_smart_ptr INTERFACE boost::assert)
target_link_libraries(boost_smart_ptr INTERFACE boost::type_traits)
target_link_libraries(boost_smart_ptr INTERFACE boost::config)
target_link_libraries(boost_smart_ptr INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_smart_ptr INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
