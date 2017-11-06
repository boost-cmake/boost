cmake_minimum_required(VERSION 3.5)
project(boost_fusion)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function_types)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_typeof)
find_package(boost_mpl)
find_package(boost_tuple)
find_package(boost_functional)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_fusion INTERFACE
)
set_property(TARGET boost_fusion PROPERTY EXPORT_NAME fusion)

target_link_libraries(boost_fusion INTERFACE boost::function_types)
target_link_libraries(boost_fusion INTERFACE boost::core)
target_link_libraries(boost_fusion INTERFACE boost::static_assert)
target_link_libraries(boost_fusion INTERFACE boost::typeof)
target_link_libraries(boost_fusion INTERFACE boost::mpl)
target_link_libraries(boost_fusion INTERFACE boost::tuple)
target_link_libraries(boost_fusion INTERFACE boost::functional)
target_link_libraries(boost_fusion INTERFACE boost::type_traits)
target_link_libraries(boost_fusion INTERFACE boost::preprocessor)
target_link_libraries(boost_fusion INTERFACE boost::config)
target_link_libraries(boost_fusion INTERFACE boost::utility)




bcm_deploy(TARGETS boost_fusion INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
