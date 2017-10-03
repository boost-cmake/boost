cmake_minimum_required(VERSION 3.5)
project(boost_fiber)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_predef)
find_package(boost_assert)
find_package(boost_smart_ptr)
find_package(boost_context)
find_package(boost_intrusive)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_fiber 
src/barrier.cpp
src/properties.cpp
src/future.cpp
src/scheduler.cpp
src/timed_mutex.cpp
src/condition_variable.cpp
src/mutex.cpp
src/recursive_timed_mutex.cpp
src/recursive_mutex.cpp
src/fiber.cpp
src/context.cpp
)
set_property(TARGET boost_fiber PROPERTY EXPORT_NAME fiber)

target_link_libraries(boost_fiber PUBLIC boost::predef)
target_link_libraries(boost_fiber PUBLIC boost::assert)
target_link_libraries(boost_fiber PUBLIC boost::smart_ptr)
target_link_libraries(boost_fiber PUBLIC boost::context)
target_link_libraries(boost_fiber PUBLIC boost::intrusive)
target_link_libraries(boost_fiber PUBLIC boost::config)



target_include_directories(boost_fiber PRIVATE include)

bcm_deploy(TARGETS boost_fiber INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
