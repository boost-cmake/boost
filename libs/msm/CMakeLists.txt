cmake_minimum_required(VERSION 3.5)
project(boost_msm)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_phoenix)
find_package(boost_proto)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_tuple)
find_package(boost_fusion)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_circular_buffer)
find_package(boost_serialization)
find_package(boost_config)
find_package(boost_parameter)
find_package(boost_any)
find_package(boost_typeof)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_msm INTERFACE
)
set_property(TARGET boost_msm PROPERTY EXPORT_NAME msm)

target_link_libraries(boost_msm INTERFACE boost::function)
target_link_libraries(boost_msm INTERFACE boost::core)
target_link_libraries(boost_msm INTERFACE boost::phoenix)
target_link_libraries(boost_msm INTERFACE boost::proto)
target_link_libraries(boost_msm INTERFACE boost::bind)
target_link_libraries(boost_msm INTERFACE boost::mpl)
target_link_libraries(boost_msm INTERFACE boost::tuple)
target_link_libraries(boost_msm INTERFACE boost::fusion)
target_link_libraries(boost_msm INTERFACE boost::assert)
target_link_libraries(boost_msm INTERFACE boost::type_traits)
target_link_libraries(boost_msm INTERFACE boost::preprocessor)
target_link_libraries(boost_msm INTERFACE boost::circular_buffer)
target_link_libraries(boost_msm INTERFACE boost::serialization)
target_link_libraries(boost_msm INTERFACE boost::config)
target_link_libraries(boost_msm INTERFACE boost::parameter)
target_link_libraries(boost_msm INTERFACE boost::any)
target_link_libraries(boost_msm INTERFACE boost::typeof)




bcm_deploy(TARGETS boost_msm INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
