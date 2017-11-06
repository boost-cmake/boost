cmake_minimum_required(VERSION 3.5)
project(boost_timer)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_chrono)
find_package(boost_system)
find_package(boost_io)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_timer 
src/auto_timers_construction.cpp
src/cpu_timer.cpp
)
set_property(TARGET boost_timer PROPERTY EXPORT_NAME timer)

target_link_libraries(boost_timer PUBLIC boost::core)
target_link_libraries(boost_timer PUBLIC boost::chrono)
target_link_libraries(boost_timer PUBLIC boost::system)
target_link_libraries(boost_timer PUBLIC boost::io)
target_link_libraries(boost_timer PUBLIC boost::config)
target_link_libraries(boost_timer PUBLIC boost::throw_exception)



target_include_directories(boost_timer PRIVATE include)

bcm_deploy(TARGETS boost_timer INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
