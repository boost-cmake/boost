cmake_minimum_required(VERSION 3.5)
project(boost_iterator)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function_types)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_smart_ptr)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_conversion)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_iterator INTERFACE
)
set_property(TARGET boost_iterator PROPERTY EXPORT_NAME iterator)

target_link_libraries(boost_iterator INTERFACE boost::function_types)
target_link_libraries(boost_iterator INTERFACE boost::core)
target_link_libraries(boost_iterator INTERFACE boost::static_assert)
target_link_libraries(boost_iterator INTERFACE boost::optional)
target_link_libraries(boost_iterator INTERFACE boost::mpl)
target_link_libraries(boost_iterator INTERFACE boost::detail)
target_link_libraries(boost_iterator INTERFACE boost::assert)
target_link_libraries(boost_iterator INTERFACE boost::fusion)
target_link_libraries(boost_iterator INTERFACE boost::type_traits)
target_link_libraries(boost_iterator INTERFACE boost::concept_check)
target_link_libraries(boost_iterator INTERFACE boost::smart_ptr)
target_link_libraries(boost_iterator INTERFACE boost::utility)
target_link_libraries(boost_iterator INTERFACE boost::config)
target_link_libraries(boost_iterator INTERFACE boost::conversion)




bcm_deploy(TARGETS boost_iterator INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
