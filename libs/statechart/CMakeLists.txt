cmake_minimum_required(VERSION 3.5)
project(boost_statechart)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_thread)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_conversion)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_statechart INTERFACE
)
set_property(TARGET boost_statechart PROPERTY EXPORT_NAME statechart)

target_link_libraries(boost_statechart INTERFACE boost::function)
target_link_libraries(boost_statechart INTERFACE boost::core)
target_link_libraries(boost_statechart INTERFACE boost::static_assert)
target_link_libraries(boost_statechart INTERFACE boost::thread)
target_link_libraries(boost_statechart INTERFACE boost::bind)
target_link_libraries(boost_statechart INTERFACE boost::mpl)
target_link_libraries(boost_statechart INTERFACE boost::detail)
target_link_libraries(boost_statechart INTERFACE boost::assert)
target_link_libraries(boost_statechart INTERFACE boost::type_traits)
target_link_libraries(boost_statechart INTERFACE boost::smart_ptr)
target_link_libraries(boost_statechart INTERFACE boost::config)
target_link_libraries(boost_statechart INTERFACE boost::conversion)




bcm_deploy(TARGETS boost_statechart INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
