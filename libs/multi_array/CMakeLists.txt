cmake_minimum_required(VERSION 3.5)
project(boost_multi_array)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_array)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_multi_array INTERFACE
)
set_property(TARGET boost_multi_array PROPERTY EXPORT_NAME multi_array)

target_link_libraries(boost_multi_array INTERFACE boost::core)
target_link_libraries(boost_multi_array INTERFACE boost::static_assert)
target_link_libraries(boost_multi_array INTERFACE boost::iterator)
target_link_libraries(boost_multi_array INTERFACE boost::mpl)
target_link_libraries(boost_multi_array INTERFACE boost::functional)
target_link_libraries(boost_multi_array INTERFACE boost::assert)
target_link_libraries(boost_multi_array INTERFACE boost::type_traits)
target_link_libraries(boost_multi_array INTERFACE boost::concept_check)
target_link_libraries(boost_multi_array INTERFACE boost::array)
target_link_libraries(boost_multi_array INTERFACE boost::config)




bcm_deploy(TARGETS boost_multi_array INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
