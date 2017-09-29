cmake_minimum_required(VERSION 3.5)
project(boost_lockfree)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_tuple)
find_package(boost_config)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_atomic)
find_package(boost_integer)
find_package(boost_array)
find_package(boost_parameter)
find_package(boost_align)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_lockfree INTERFACE
)
set_property(TARGET boost_lockfree PROPERTY EXPORT_NAME lockfree)

target_link_libraries(boost_lockfree INTERFACE boost::core)
target_link_libraries(boost_lockfree INTERFACE boost::static_assert)
target_link_libraries(boost_lockfree INTERFACE boost::predef)
target_link_libraries(boost_lockfree INTERFACE boost::tuple)
target_link_libraries(boost_lockfree INTERFACE boost::config)
target_link_libraries(boost_lockfree INTERFACE boost::mpl)
target_link_libraries(boost_lockfree INTERFACE boost::assert)
target_link_libraries(boost_lockfree INTERFACE boost::type_traits)
target_link_libraries(boost_lockfree INTERFACE boost::atomic)
target_link_libraries(boost_lockfree INTERFACE boost::integer)
target_link_libraries(boost_lockfree INTERFACE boost::array)
target_link_libraries(boost_lockfree INTERFACE boost::parameter)
target_link_libraries(boost_lockfree INTERFACE boost::align)
target_link_libraries(boost_lockfree INTERFACE boost::utility)




bcm_deploy(TARGETS boost_lockfree INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
