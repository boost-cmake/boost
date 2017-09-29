cmake_minimum_required(VERSION 3.5)
project(boost_multi_index)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_functional)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_smart_ptr)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_foreach)
find_package(boost_integer)
find_package(boost_serialization)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_multi_index INTERFACE
)
set_property(TARGET boost_multi_index PROPERTY EXPORT_NAME multi_index)

target_link_libraries(boost_multi_index INTERFACE boost::core)
target_link_libraries(boost_multi_index INTERFACE boost::static_assert)
target_link_libraries(boost_multi_index INTERFACE boost::functional)
target_link_libraries(boost_multi_index INTERFACE boost::iterator)
target_link_libraries(boost_multi_index INTERFACE boost::tuple)
target_link_libraries(boost_multi_index INTERFACE boost::bind)
target_link_libraries(boost_multi_index INTERFACE boost::mpl)
target_link_libraries(boost_multi_index INTERFACE boost::move)
target_link_libraries(boost_multi_index INTERFACE boost::detail)
target_link_libraries(boost_multi_index INTERFACE boost::assert)
target_link_libraries(boost_multi_index INTERFACE boost::smart_ptr)
target_link_libraries(boost_multi_index INTERFACE boost::type_traits)
target_link_libraries(boost_multi_index INTERFACE boost::preprocessor)
target_link_libraries(boost_multi_index INTERFACE boost::foreach)
target_link_libraries(boost_multi_index INTERFACE boost::integer)
target_link_libraries(boost_multi_index INTERFACE boost::serialization)
target_link_libraries(boost_multi_index INTERFACE boost::config)
target_link_libraries(boost_multi_index INTERFACE boost::throw_exception)
target_link_libraries(boost_multi_index INTERFACE boost::utility)




bcm_deploy(TARGETS boost_multi_index INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
