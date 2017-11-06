cmake_minimum_required(VERSION 3.5)
project(boost_dll)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_winapi)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_type_index)
find_package(boost_system)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_spirit)
find_package(boost_filesystem)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_dll INTERFACE
)
set_property(TARGET boost_dll PROPERTY EXPORT_NAME dll)

target_link_libraries(boost_dll INTERFACE boost::function)
target_link_libraries(boost_dll INTERFACE boost::core)
target_link_libraries(boost_dll INTERFACE boost::static_assert)
target_link_libraries(boost_dll INTERFACE boost::predef)
target_link_libraries(boost_dll INTERFACE boost::winapi)
target_link_libraries(boost_dll INTERFACE boost::mpl)
target_link_libraries(boost_dll INTERFACE boost::move)
target_link_libraries(boost_dll INTERFACE boost::type_index)
target_link_libraries(boost_dll INTERFACE boost::system)
target_link_libraries(boost_dll INTERFACE boost::type_traits)
target_link_libraries(boost_dll INTERFACE boost::smart_ptr)
target_link_libraries(boost_dll INTERFACE boost::spirit)
target_link_libraries(boost_dll INTERFACE boost::filesystem)
target_link_libraries(boost_dll INTERFACE boost::config)
target_link_libraries(boost_dll INTERFACE boost::throw_exception)

if(UNIX AND NOT APPLE)
target_link_libraries(boost_dll INTERFACE -ldl)
endif()


bcm_deploy(TARGETS boost_dll INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
