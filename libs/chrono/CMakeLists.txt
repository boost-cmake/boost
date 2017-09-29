cmake_minimum_required(VERSION 3.5)
project(boost_chrono)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_ratio)
find_package(boost_predef)
find_package(boost_winapi)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_system)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_typeof)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_chrono 
src/chrono.cpp
src/thread_clock.cpp
src/process_cpu_clocks.cpp
)
set_property(TARGET boost_chrono PROPERTY EXPORT_NAME chrono)

target_link_libraries(boost_chrono PUBLIC boost::core)
target_link_libraries(boost_chrono PUBLIC boost::static_assert)
target_link_libraries(boost_chrono PUBLIC boost::ratio)
target_link_libraries(boost_chrono PUBLIC boost::predef)
target_link_libraries(boost_chrono PUBLIC boost::winapi)
target_link_libraries(boost_chrono PUBLIC boost::mpl)
target_link_libraries(boost_chrono PUBLIC boost::move)
target_link_libraries(boost_chrono PUBLIC boost::system)
target_link_libraries(boost_chrono PUBLIC boost::assert)
target_link_libraries(boost_chrono PUBLIC boost::type_traits)
target_link_libraries(boost_chrono PUBLIC boost::typeof)
target_link_libraries(boost_chrono PUBLIC boost::integer)
target_link_libraries(boost_chrono PUBLIC boost::config)
target_link_libraries(boost_chrono PUBLIC boost::throw_exception)
target_link_libraries(boost_chrono PUBLIC boost::utility)



target_include_directories(boost_chrono PRIVATE include)

bcm_deploy(TARGETS boost_chrono INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
