cmake_minimum_required(VERSION 3.5)
project(boost_scope_exit)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_typeof)
find_package(boost_config)
find_package(boost_preprocessor)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_scope_exit INTERFACE
)
set_property(TARGET boost_scope_exit PROPERTY EXPORT_NAME scope_exit)

target_link_libraries(boost_scope_exit INTERFACE boost::function)
target_link_libraries(boost_scope_exit INTERFACE boost::core)
target_link_libraries(boost_scope_exit INTERFACE boost::mpl)
target_link_libraries(boost_scope_exit INTERFACE boost::type_traits)
target_link_libraries(boost_scope_exit INTERFACE boost::typeof)
target_link_libraries(boost_scope_exit INTERFACE boost::config)
target_link_libraries(boost_scope_exit INTERFACE boost::preprocessor)




bcm_deploy(TARGETS boost_scope_exit INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
