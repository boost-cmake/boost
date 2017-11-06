cmake_minimum_required(VERSION 3.5)
project(boost_utility)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_utility INTERFACE
)
set_property(TARGET boost_utility PROPERTY EXPORT_NAME utility)

target_link_libraries(boost_utility INTERFACE boost::core)
target_link_libraries(boost_utility INTERFACE boost::static_assert)
target_link_libraries(boost_utility INTERFACE boost::mpl)
target_link_libraries(boost_utility INTERFACE boost::type_traits)
target_link_libraries(boost_utility INTERFACE boost::preprocessor)
target_link_libraries(boost_utility INTERFACE boost::config)
target_link_libraries(boost_utility INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_utility INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
