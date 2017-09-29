cmake_minimum_required(VERSION 3.5)
project(boost_function)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_type_traits)
find_package(boost_assert)
find_package(boost_type_index)
find_package(boost_preprocessor)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_typeof)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_function INTERFACE
)
set_property(TARGET boost_function PROPERTY EXPORT_NAME function)

target_link_libraries(boost_function INTERFACE boost::core)
target_link_libraries(boost_function INTERFACE boost::bind)
target_link_libraries(boost_function INTERFACE boost::mpl)
target_link_libraries(boost_function INTERFACE boost::move)
target_link_libraries(boost_function INTERFACE boost::type_traits)
target_link_libraries(boost_function INTERFACE boost::assert)
target_link_libraries(boost_function INTERFACE boost::type_index)
target_link_libraries(boost_function INTERFACE boost::preprocessor)
target_link_libraries(boost_function INTERFACE boost::integer)
target_link_libraries(boost_function INTERFACE boost::config)
target_link_libraries(boost_function INTERFACE boost::throw_exception)
target_link_libraries(boost_function INTERFACE boost::typeof)




bcm_deploy(TARGETS boost_function INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
