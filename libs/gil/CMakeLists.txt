cmake_minimum_required(VERSION 3.5)
project(boost_gil)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_preprocessor)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_gil INTERFACE
)
set_property(TARGET boost_gil PROPERTY EXPORT_NAME gil)

target_link_libraries(boost_gil INTERFACE boost::core)
target_link_libraries(boost_gil INTERFACE boost::static_assert)
target_link_libraries(boost_gil INTERFACE boost::iterator)
target_link_libraries(boost_gil INTERFACE boost::bind)
target_link_libraries(boost_gil INTERFACE boost::mpl)
target_link_libraries(boost_gil INTERFACE boost::type_traits)
target_link_libraries(boost_gil INTERFACE boost::concept_check)
target_link_libraries(boost_gil INTERFACE boost::smart_ptr)
target_link_libraries(boost_gil INTERFACE boost::config)
target_link_libraries(boost_gil INTERFACE boost::preprocessor)




bcm_deploy(TARGETS boost_gil INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
