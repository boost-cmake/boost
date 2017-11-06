cmake_minimum_required(VERSION 3.5)
project(boost_mpl)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_mpl INTERFACE
)
set_property(TARGET boost_mpl PROPERTY EXPORT_NAME mpl)

target_link_libraries(boost_mpl INTERFACE boost::core)
target_link_libraries(boost_mpl INTERFACE boost::static_assert)
target_link_libraries(boost_mpl INTERFACE boost::predef)
target_link_libraries(boost_mpl INTERFACE boost::type_traits)
target_link_libraries(boost_mpl INTERFACE boost::preprocessor)
target_link_libraries(boost_mpl INTERFACE boost::config)
target_link_libraries(boost_mpl INTERFACE boost::utility)




bcm_deploy(TARGETS boost_mpl INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
