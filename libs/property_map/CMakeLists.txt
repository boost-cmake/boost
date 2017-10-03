cmake_minimum_required(VERSION 3.5)
project(boost_property_map)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_multi_index)
find_package(boost_any)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_smart_ptr)
find_package(boost_bind)
find_package(boost_serialization)
find_package(boost_lexical_cast)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_property_map INTERFACE
)
set_property(TARGET boost_property_map PROPERTY EXPORT_NAME property_map)

target_link_libraries(boost_property_map INTERFACE boost::function)
target_link_libraries(boost_property_map INTERFACE boost::core)
target_link_libraries(boost_property_map INTERFACE boost::static_assert)
target_link_libraries(boost_property_map INTERFACE boost::iterator)
target_link_libraries(boost_property_map INTERFACE boost::optional)
target_link_libraries(boost_property_map INTERFACE boost::mpl)
target_link_libraries(boost_property_map INTERFACE boost::multi_index)
target_link_libraries(boost_property_map INTERFACE boost::any)
target_link_libraries(boost_property_map INTERFACE boost::assert)
target_link_libraries(boost_property_map INTERFACE boost::type_traits)
target_link_libraries(boost_property_map INTERFACE boost::concept_check)
target_link_libraries(boost_property_map INTERFACE boost::smart_ptr)
target_link_libraries(boost_property_map INTERFACE boost::bind)
target_link_libraries(boost_property_map INTERFACE boost::serialization)
target_link_libraries(boost_property_map INTERFACE boost::lexical_cast)
target_link_libraries(boost_property_map INTERFACE boost::config)
target_link_libraries(boost_property_map INTERFACE boost::throw_exception)
target_link_libraries(boost_property_map INTERFACE boost::utility)




bcm_deploy(TARGETS boost_property_map INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
