cmake_minimum_required(VERSION 3.5)
project(boost_concept_check)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_concept_check INTERFACE
)
set_property(TARGET boost_concept_check PROPERTY EXPORT_NAME concept_check)

target_link_libraries(boost_concept_check INTERFACE boost::core)
target_link_libraries(boost_concept_check INTERFACE boost::mpl)
target_link_libraries(boost_concept_check INTERFACE boost::type_traits)
target_link_libraries(boost_concept_check INTERFACE boost::preprocessor)
target_link_libraries(boost_concept_check INTERFACE boost::config)




bcm_deploy(TARGETS boost_concept_check INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
