cmake_minimum_required(VERSION 3.5)
project(boost_metaparse)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_metaparse INTERFACE
)
set_property(TARGET boost_metaparse PROPERTY EXPORT_NAME metaparse)

target_link_libraries(boost_metaparse INTERFACE boost::static_assert)
target_link_libraries(boost_metaparse INTERFACE boost::predef)
target_link_libraries(boost_metaparse INTERFACE boost::mpl)
target_link_libraries(boost_metaparse INTERFACE boost::type_traits)
target_link_libraries(boost_metaparse INTERFACE boost::preprocessor)
target_link_libraries(boost_metaparse INTERFACE boost::config)




bcm_deploy(TARGETS boost_metaparse INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
