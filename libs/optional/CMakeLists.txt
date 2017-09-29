cmake_minimum_required(VERSION 3.5)
project(boost_optional)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_config)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_throw_exception)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_optional INTERFACE
)
set_property(TARGET boost_optional PROPERTY EXPORT_NAME optional)

target_link_libraries(boost_optional INTERFACE boost::core)
target_link_libraries(boost_optional INTERFACE boost::static_assert)
target_link_libraries(boost_optional INTERFACE boost::config)
target_link_libraries(boost_optional INTERFACE boost::mpl)
target_link_libraries(boost_optional INTERFACE boost::move)
target_link_libraries(boost_optional INTERFACE boost::detail)
target_link_libraries(boost_optional INTERFACE boost::assert)
target_link_libraries(boost_optional INTERFACE boost::type_traits)
target_link_libraries(boost_optional INTERFACE boost::throw_exception)
target_link_libraries(boost_optional INTERFACE boost::utility)




bcm_deploy(TARGETS boost_optional INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
