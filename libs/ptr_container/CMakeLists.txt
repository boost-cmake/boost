cmake_minimum_required(VERSION 3.5)
project(boost_ptr_container)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_smart_ptr)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_circular_buffer)
find_package(boost_serialization)
find_package(boost_array)
find_package(boost_config)
find_package(boost_unordered)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_ptr_container INTERFACE
)
set_property(TARGET boost_ptr_container PROPERTY EXPORT_NAME ptr_container)

target_link_libraries(boost_ptr_container INTERFACE boost::core)
target_link_libraries(boost_ptr_container INTERFACE boost::static_assert)
target_link_libraries(boost_ptr_container INTERFACE boost::iterator)
target_link_libraries(boost_ptr_container INTERFACE boost::mpl)
target_link_libraries(boost_ptr_container INTERFACE boost::smart_ptr)
target_link_libraries(boost_ptr_container INTERFACE boost::assert)
target_link_libraries(boost_ptr_container INTERFACE boost::range)
target_link_libraries(boost_ptr_container INTERFACE boost::type_traits)
target_link_libraries(boost_ptr_container INTERFACE boost::circular_buffer)
target_link_libraries(boost_ptr_container INTERFACE boost::serialization)
target_link_libraries(boost_ptr_container INTERFACE boost::array)
target_link_libraries(boost_ptr_container INTERFACE boost::config)
target_link_libraries(boost_ptr_container INTERFACE boost::unordered)
target_link_libraries(boost_ptr_container INTERFACE boost::utility)




bcm_deploy(TARGETS boost_ptr_container INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
