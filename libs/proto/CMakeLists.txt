cmake_minimum_required(VERSION 3.5)
project(boost_proto)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_range)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_typeof)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_proto INTERFACE
)
set_property(TARGET boost_proto PROPERTY EXPORT_NAME proto)

target_link_libraries(boost_proto INTERFACE boost::core)
target_link_libraries(boost_proto INTERFACE boost::static_assert)
target_link_libraries(boost_proto INTERFACE boost::mpl)
target_link_libraries(boost_proto INTERFACE boost::range)
target_link_libraries(boost_proto INTERFACE boost::fusion)
target_link_libraries(boost_proto INTERFACE boost::type_traits)
target_link_libraries(boost_proto INTERFACE boost::preprocessor)
target_link_libraries(boost_proto INTERFACE boost::utility)
target_link_libraries(boost_proto INTERFACE boost::config)
target_link_libraries(boost_proto INTERFACE boost::typeof)




bcm_deploy(TARGETS boost_proto INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
