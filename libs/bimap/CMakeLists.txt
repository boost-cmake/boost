cmake_minimum_required(VERSION 3.5)
project(boost_bimap)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_property_map)
find_package(boost_mpl)
find_package(boost_multi_index)
find_package(boost_functional)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_preprocessor)
find_package(boost_serialization)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_lambda)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_bimap INTERFACE
)
set_property(TARGET boost_bimap PROPERTY EXPORT_NAME bimap)

target_link_libraries(boost_bimap INTERFACE boost::core)
target_link_libraries(boost_bimap INTERFACE boost::static_assert)
target_link_libraries(boost_bimap INTERFACE boost::iterator)
target_link_libraries(boost_bimap INTERFACE boost::property_map)
target_link_libraries(boost_bimap INTERFACE boost::mpl)
target_link_libraries(boost_bimap INTERFACE boost::multi_index)
target_link_libraries(boost_bimap INTERFACE boost::functional)
target_link_libraries(boost_bimap INTERFACE boost::type_traits)
target_link_libraries(boost_bimap INTERFACE boost::concept_check)
target_link_libraries(boost_bimap INTERFACE boost::preprocessor)
target_link_libraries(boost_bimap INTERFACE boost::serialization)
target_link_libraries(boost_bimap INTERFACE boost::utility)
target_link_libraries(boost_bimap INTERFACE boost::config)
target_link_libraries(boost_bimap INTERFACE boost::throw_exception)
target_link_libraries(boost_bimap INTERFACE boost::lambda)




bcm_deploy(TARGETS boost_bimap INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
