cmake_minimum_required(VERSION 3.5)
project(boost_random)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_mpl)
find_package(boost_system)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_math)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_random 
src/random_device.cpp
)
set_property(TARGET boost_random PROPERTY EXPORT_NAME random)

target_link_libraries(boost_random PUBLIC boost::core)
target_link_libraries(boost_random PUBLIC boost::static_assert)
target_link_libraries(boost_random PUBLIC boost::mpl)
target_link_libraries(boost_random PUBLIC boost::system)
target_link_libraries(boost_random PUBLIC boost::assert)
target_link_libraries(boost_random PUBLIC boost::range)
target_link_libraries(boost_random PUBLIC boost::type_traits)
target_link_libraries(boost_random PUBLIC boost::integer)
target_link_libraries(boost_random PUBLIC boost::config)
target_link_libraries(boost_random PUBLIC boost::throw_exception)
target_link_libraries(boost_random PUBLIC boost::math)
target_link_libraries(boost_random PUBLIC boost::utility)



target_include_directories(boost_random PRIVATE include)

bcm_deploy(TARGETS boost_random INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
