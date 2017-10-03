cmake_minimum_required(VERSION 3.5)
project(boost_units)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_typeof)
find_package(boost_io)
find_package(boost_integer)
find_package(boost_serialization)
find_package(boost_config)
find_package(boost_math)
find_package(boost_lambda)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_units INTERFACE
)
set_property(TARGET boost_units PROPERTY EXPORT_NAME units)

target_link_libraries(boost_units INTERFACE boost::core)
target_link_libraries(boost_units INTERFACE boost::static_assert)
target_link_libraries(boost_units INTERFACE boost::mpl)
target_link_libraries(boost_units INTERFACE boost::assert)
target_link_libraries(boost_units INTERFACE boost::type_traits)
target_link_libraries(boost_units INTERFACE boost::preprocessor)
target_link_libraries(boost_units INTERFACE boost::typeof)
target_link_libraries(boost_units INTERFACE boost::io)
target_link_libraries(boost_units INTERFACE boost::integer)
target_link_libraries(boost_units INTERFACE boost::serialization)
target_link_libraries(boost_units INTERFACE boost::config)
target_link_libraries(boost_units INTERFACE boost::math)
target_link_libraries(boost_units INTERFACE boost::lambda)




bcm_deploy(TARGETS boost_units INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
