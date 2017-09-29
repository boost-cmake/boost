cmake_minimum_required(VERSION 3.5)
project(boost_container)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_move)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_intrusive)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_container 
src/unsynchronized_pool_resource.cpp
src/monotonic_buffer_resource.cpp
src/synchronized_pool_resource.cpp
src/dlmalloc.cpp
src/pool_resource.cpp
src/global_resource.cpp
)
set_property(TARGET boost_container PROPERTY EXPORT_NAME container)

target_link_libraries(boost_container PUBLIC boost::core)
target_link_libraries(boost_container PUBLIC boost::static_assert)
target_link_libraries(boost_container PUBLIC boost::move)
target_link_libraries(boost_container PUBLIC boost::functional)
target_link_libraries(boost_container PUBLIC boost::assert)
target_link_libraries(boost_container PUBLIC boost::type_traits)
target_link_libraries(boost_container PUBLIC boost::intrusive)
target_link_libraries(boost_container PUBLIC boost::config)



target_include_directories(boost_container PRIVATE include)

bcm_deploy(TARGETS boost_container INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
