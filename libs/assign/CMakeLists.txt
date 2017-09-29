cmake_minimum_required(VERSION 3.5)
project(boost_assign)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_static_assert)
find_package(boost_ptr_container)
find_package(boost_tuple)
find_package(boost_mpl)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_array)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_assign INTERFACE
)
set_property(TARGET boost_assign PROPERTY EXPORT_NAME assign)

target_link_libraries(boost_assign INTERFACE boost::static_assert)
target_link_libraries(boost_assign INTERFACE boost::ptr_container)
target_link_libraries(boost_assign INTERFACE boost::tuple)
target_link_libraries(boost_assign INTERFACE boost::mpl)
target_link_libraries(boost_assign INTERFACE boost::range)
target_link_libraries(boost_assign INTERFACE boost::type_traits)
target_link_libraries(boost_assign INTERFACE boost::preprocessor)
target_link_libraries(boost_assign INTERFACE boost::array)
target_link_libraries(boost_assign INTERFACE boost::config)




bcm_deploy(TARGETS boost_assign INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
