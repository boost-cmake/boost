cmake_minimum_required(VERSION 3.5)
project(boost_disjoint_sets)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_graph)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_disjoint_sets INTERFACE
)
set_property(TARGET boost_disjoint_sets PROPERTY EXPORT_NAME disjoint_sets)

target_link_libraries(boost_disjoint_sets INTERFACE boost::graph)




bcm_deploy(TARGETS boost_disjoint_sets INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
