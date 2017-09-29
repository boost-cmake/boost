cmake_minimum_required(VERSION 3.5)
project(boost_pool)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_thread)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_pool INTERFACE
)
set_property(TARGET boost_pool PROPERTY EXPORT_NAME pool)

target_link_libraries(boost_pool INTERFACE boost::thread)
target_link_libraries(boost_pool INTERFACE boost::assert)
target_link_libraries(boost_pool INTERFACE boost::type_traits)
target_link_libraries(boost_pool INTERFACE boost::integer)
target_link_libraries(boost_pool INTERFACE boost::config)
target_link_libraries(boost_pool INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_pool INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
