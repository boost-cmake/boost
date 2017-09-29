cmake_minimum_required(VERSION 3.5)
project(boost_intrusive)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_move)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_intrusive INTERFACE
)
set_property(TARGET boost_intrusive PROPERTY EXPORT_NAME intrusive)

target_link_libraries(boost_intrusive INTERFACE boost::core)
target_link_libraries(boost_intrusive INTERFACE boost::static_assert)
target_link_libraries(boost_intrusive INTERFACE boost::move)
target_link_libraries(boost_intrusive INTERFACE boost::functional)
target_link_libraries(boost_intrusive INTERFACE boost::assert)
target_link_libraries(boost_intrusive INTERFACE boost::config)




bcm_deploy(TARGETS boost_intrusive INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
