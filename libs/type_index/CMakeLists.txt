cmake_minimum_required(VERSION 3.5)
project(boost_type_index)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_smart_ptr)
find_package(boost_type_traits)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_preprocessor)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_type_index INTERFACE
)
set_property(TARGET boost_type_index PROPERTY EXPORT_NAME type_index)

target_link_libraries(boost_type_index INTERFACE boost::core)
target_link_libraries(boost_type_index INTERFACE boost::static_assert)
target_link_libraries(boost_type_index INTERFACE boost::mpl)
target_link_libraries(boost_type_index INTERFACE boost::smart_ptr)
target_link_libraries(boost_type_index INTERFACE boost::type_traits)
target_link_libraries(boost_type_index INTERFACE boost::config)
target_link_libraries(boost_type_index INTERFACE boost::throw_exception)
target_link_libraries(boost_type_index INTERFACE boost::preprocessor)




bcm_deploy(TARGETS boost_type_index INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
