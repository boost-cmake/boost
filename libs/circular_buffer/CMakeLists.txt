cmake_minimum_required(VERSION 3.5)
project(boost_circular_buffer)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_container)
find_package(boost_iterator)
find_package(boost_move)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_circular_buffer INTERFACE
)
set_property(TARGET boost_circular_buffer PROPERTY EXPORT_NAME circular_buffer)

target_link_libraries(boost_circular_buffer INTERFACE boost::core)
target_link_libraries(boost_circular_buffer INTERFACE boost::static_assert)
target_link_libraries(boost_circular_buffer INTERFACE boost::container)
target_link_libraries(boost_circular_buffer INTERFACE boost::iterator)
target_link_libraries(boost_circular_buffer INTERFACE boost::move)
target_link_libraries(boost_circular_buffer INTERFACE boost::assert)
target_link_libraries(boost_circular_buffer INTERFACE boost::type_traits)
target_link_libraries(boost_circular_buffer INTERFACE boost::concept_check)
target_link_libraries(boost_circular_buffer INTERFACE boost::config)
target_link_libraries(boost_circular_buffer INTERFACE boost::throw_exception)
target_link_libraries(boost_circular_buffer INTERFACE boost::utility)




bcm_deploy(TARGETS boost_circular_buffer INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
