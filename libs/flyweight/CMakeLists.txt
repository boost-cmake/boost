cmake_minimum_required(VERSION 3.5)
project(boost_flyweight)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_config)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_interprocess)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_serialization)
find_package(boost_multi_index)
find_package(boost_parameter)
find_package(boost_throw_exception)
find_package(boost_smart_ptr)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_flyweight INTERFACE
)
set_property(TARGET boost_flyweight PROPERTY EXPORT_NAME flyweight)

target_link_libraries(boost_flyweight INTERFACE boost::core)
target_link_libraries(boost_flyweight INTERFACE boost::config)
target_link_libraries(boost_flyweight INTERFACE boost::mpl)
target_link_libraries(boost_flyweight INTERFACE boost::detail)
target_link_libraries(boost_flyweight INTERFACE boost::functional)
target_link_libraries(boost_flyweight INTERFACE boost::assert)
target_link_libraries(boost_flyweight INTERFACE boost::interprocess)
target_link_libraries(boost_flyweight INTERFACE boost::type_traits)
target_link_libraries(boost_flyweight INTERFACE boost::preprocessor)
target_link_libraries(boost_flyweight INTERFACE boost::serialization)
target_link_libraries(boost_flyweight INTERFACE boost::multi_index)
target_link_libraries(boost_flyweight INTERFACE boost::parameter)
target_link_libraries(boost_flyweight INTERFACE boost::throw_exception)
target_link_libraries(boost_flyweight INTERFACE boost::smart_ptr)




bcm_deploy(TARGETS boost_flyweight INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
