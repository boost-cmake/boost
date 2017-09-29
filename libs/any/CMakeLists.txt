cmake_minimum_required(VERSION 3.5)
project(boost_any)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_type_index)
find_package(boost_type_traits)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_any INTERFACE
)
set_property(TARGET boost_any PROPERTY EXPORT_NAME any)

target_link_libraries(boost_any INTERFACE boost::core)
target_link_libraries(boost_any INTERFACE boost::static_assert)
target_link_libraries(boost_any INTERFACE boost::mpl)
target_link_libraries(boost_any INTERFACE boost::type_index)
target_link_libraries(boost_any INTERFACE boost::type_traits)
target_link_libraries(boost_any INTERFACE boost::config)
target_link_libraries(boost_any INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_any INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
