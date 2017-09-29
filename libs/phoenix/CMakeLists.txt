cmake_minimum_required(VERSION 3.5)
project(boost_phoenix)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_predef)
find_package(boost_proto)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_range)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_smart_ptr)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_phoenix INTERFACE
)
set_property(TARGET boost_phoenix PROPERTY EXPORT_NAME phoenix)

target_link_libraries(boost_phoenix INTERFACE boost::function)
target_link_libraries(boost_phoenix INTERFACE boost::core)
target_link_libraries(boost_phoenix INTERFACE boost::predef)
target_link_libraries(boost_phoenix INTERFACE boost::proto)
target_link_libraries(boost_phoenix INTERFACE boost::bind)
target_link_libraries(boost_phoenix INTERFACE boost::mpl)
target_link_libraries(boost_phoenix INTERFACE boost::range)
target_link_libraries(boost_phoenix INTERFACE boost::detail)
target_link_libraries(boost_phoenix INTERFACE boost::assert)
target_link_libraries(boost_phoenix INTERFACE boost::smart_ptr)
target_link_libraries(boost_phoenix INTERFACE boost::fusion)
target_link_libraries(boost_phoenix INTERFACE boost::type_traits)
target_link_libraries(boost_phoenix INTERFACE boost::preprocessor)
target_link_libraries(boost_phoenix INTERFACE boost::config)
target_link_libraries(boost_phoenix INTERFACE boost::utility)




bcm_deploy(TARGETS boost_phoenix INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
