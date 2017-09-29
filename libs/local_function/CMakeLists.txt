cmake_minimum_required(VERSION 3.5)
project(boost_local_function)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_scope_exit)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_typeof)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_preprocessor)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_local_function INTERFACE
)
set_property(TARGET boost_local_function PROPERTY EXPORT_NAME local_function)

target_link_libraries(boost_local_function INTERFACE boost::scope_exit)
target_link_libraries(boost_local_function INTERFACE boost::mpl)
target_link_libraries(boost_local_function INTERFACE boost::type_traits)
target_link_libraries(boost_local_function INTERFACE boost::typeof)
target_link_libraries(boost_local_function INTERFACE boost::utility)
target_link_libraries(boost_local_function INTERFACE boost::config)
target_link_libraries(boost_local_function INTERFACE boost::preprocessor)




bcm_deploy(TARGETS boost_local_function INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
