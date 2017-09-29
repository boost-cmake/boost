cmake_minimum_required(VERSION 3.5)
project(boost_signals)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_iterator)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_any)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_signals 
src/connection.cpp
src/slot.cpp
src/signal_base.cpp
src/named_slot_map.cpp
src/trackable.cpp
)
set_property(TARGET boost_signals PROPERTY EXPORT_NAME signals)

target_link_libraries(boost_signals PUBLIC boost::function)
target_link_libraries(boost_signals PUBLIC boost::core)
target_link_libraries(boost_signals PUBLIC boost::iterator)
target_link_libraries(boost_signals PUBLIC boost::optional)
target_link_libraries(boost_signals PUBLIC boost::mpl)
target_link_libraries(boost_signals PUBLIC boost::type_traits)
target_link_libraries(boost_signals PUBLIC boost::smart_ptr)
target_link_libraries(boost_signals PUBLIC boost::config)
target_link_libraries(boost_signals PUBLIC boost::any)
target_link_libraries(boost_signals PUBLIC boost::utility)



target_include_directories(boost_signals PRIVATE include)

bcm_deploy(TARGETS boost_signals INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
