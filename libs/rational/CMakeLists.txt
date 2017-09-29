cmake_minimum_required(VERSION 3.5)
project(boost_rational)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_rational INTERFACE
)
set_property(TARGET boost_rational PROPERTY EXPORT_NAME rational)

target_link_libraries(boost_rational INTERFACE boost::core)
target_link_libraries(boost_rational INTERFACE boost::static_assert)
target_link_libraries(boost_rational INTERFACE boost::assert)
target_link_libraries(boost_rational INTERFACE boost::type_traits)
target_link_libraries(boost_rational INTERFACE boost::integer)
target_link_libraries(boost_rational INTERFACE boost::config)
target_link_libraries(boost_rational INTERFACE boost::throw_exception)
target_link_libraries(boost_rational INTERFACE boost::utility)




bcm_deploy(TARGETS boost_rational INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
