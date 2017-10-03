cmake_minimum_required(VERSION 3.5)
project(boost_unordered)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_container)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_move)
find_package(boost_functional)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_throw_exception)
find_package(boost_preprocessor)
find_package(boost_type_traits)
find_package(boost_config)
find_package(boost_smart_ptr)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_unordered INTERFACE
)
set_property(TARGET boost_unordered PROPERTY EXPORT_NAME unordered)

target_link_libraries(boost_unordered INTERFACE boost::core)
target_link_libraries(boost_unordered INTERFACE boost::container)
target_link_libraries(boost_unordered INTERFACE boost::iterator)
target_link_libraries(boost_unordered INTERFACE boost::tuple)
target_link_libraries(boost_unordered INTERFACE boost::move)
target_link_libraries(boost_unordered INTERFACE boost::functional)
target_link_libraries(boost_unordered INTERFACE boost::detail)
target_link_libraries(boost_unordered INTERFACE boost::assert)
target_link_libraries(boost_unordered INTERFACE boost::throw_exception)
target_link_libraries(boost_unordered INTERFACE boost::preprocessor)
target_link_libraries(boost_unordered INTERFACE boost::type_traits)
target_link_libraries(boost_unordered INTERFACE boost::config)
target_link_libraries(boost_unordered INTERFACE boost::smart_ptr)




bcm_deploy(TARGETS boost_unordered INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
