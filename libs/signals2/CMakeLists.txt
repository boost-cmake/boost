cmake_minimum_required(VERSION 3.5)
project(boost_signals2)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_predef)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_variant)
find_package(boost_multi_index)
find_package(boost_optional)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_parameter)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_smart_ptr)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_signals2 INTERFACE
)
set_property(TARGET boost_signals2 PROPERTY EXPORT_NAME signals2)

target_link_libraries(boost_signals2 INTERFACE boost::function)
target_link_libraries(boost_signals2 INTERFACE boost::core)
target_link_libraries(boost_signals2 INTERFACE boost::predef)
target_link_libraries(boost_signals2 INTERFACE boost::iterator)
target_link_libraries(boost_signals2 INTERFACE boost::tuple)
target_link_libraries(boost_signals2 INTERFACE boost::bind)
target_link_libraries(boost_signals2 INTERFACE boost::mpl)
target_link_libraries(boost_signals2 INTERFACE boost::variant)
target_link_libraries(boost_signals2 INTERFACE boost::multi_index)
target_link_libraries(boost_signals2 INTERFACE boost::optional)
target_link_libraries(boost_signals2 INTERFACE boost::assert)
target_link_libraries(boost_signals2 INTERFACE boost::type_traits)
target_link_libraries(boost_signals2 INTERFACE boost::parameter)
target_link_libraries(boost_signals2 INTERFACE boost::preprocessor)
target_link_libraries(boost_signals2 INTERFACE boost::config)
target_link_libraries(boost_signals2 INTERFACE boost::throw_exception)
target_link_libraries(boost_signals2 INTERFACE boost::smart_ptr)




bcm_deploy(TARGETS boost_signals2 INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
