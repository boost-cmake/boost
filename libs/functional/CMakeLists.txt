cmake_minimum_required(VERSION 3.5)
project(boost_functional)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_typeof)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_function_types)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_functional INTERFACE
)
set_property(TARGET boost_functional PROPERTY EXPORT_NAME functional)

target_link_libraries(boost_functional INTERFACE boost::function)
target_link_libraries(boost_functional INTERFACE boost::core)
target_link_libraries(boost_functional INTERFACE boost::static_assert)
target_link_libraries(boost_functional INTERFACE boost::iterator)
target_link_libraries(boost_functional INTERFACE boost::typeof)
target_link_libraries(boost_functional INTERFACE boost::optional)
target_link_libraries(boost_functional INTERFACE boost::mpl)
target_link_libraries(boost_functional INTERFACE boost::function_types)
target_link_libraries(boost_functional INTERFACE boost::detail)
target_link_libraries(boost_functional INTERFACE boost::assert)
target_link_libraries(boost_functional INTERFACE boost::type_traits)
target_link_libraries(boost_functional INTERFACE boost::preprocessor)
target_link_libraries(boost_functional INTERFACE boost::integer)
target_link_libraries(boost_functional INTERFACE boost::config)
target_link_libraries(boost_functional INTERFACE boost::utility)




bcm_deploy(TARGETS boost_functional INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
