cmake_minimum_required(VERSION 3.5)
project(boost_function_types)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_function_types INTERFACE
)
set_property(TARGET boost_function_types PROPERTY EXPORT_NAME function_types)

target_link_libraries(boost_function_types INTERFACE boost::core)
target_link_libraries(boost_function_types INTERFACE boost::mpl)
target_link_libraries(boost_function_types INTERFACE boost::detail)
target_link_libraries(boost_function_types INTERFACE boost::type_traits)
target_link_libraries(boost_function_types INTERFACE boost::preprocessor)
target_link_libraries(boost_function_types INTERFACE boost::config)




bcm_deploy(TARGETS boost_function_types INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
