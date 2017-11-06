cmake_minimum_required(VERSION 3.5)
project(boost_coroutine)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_exception)
find_package(boost_thread)
find_package(boost_move)
find_package(boost_system)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_context)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_coroutine 
src/exceptions.cpp
)
set_property(TARGET boost_coroutine PROPERTY EXPORT_NAME coroutine)

target_link_libraries(boost_coroutine PUBLIC boost::core)
target_link_libraries(boost_coroutine PUBLIC boost::exception)
target_link_libraries(boost_coroutine PUBLIC boost::thread)
target_link_libraries(boost_coroutine PUBLIC boost::move)
target_link_libraries(boost_coroutine PUBLIC boost::system)
target_link_libraries(boost_coroutine PUBLIC boost::assert)
target_link_libraries(boost_coroutine PUBLIC boost::range)
target_link_libraries(boost_coroutine PUBLIC boost::type_traits)
target_link_libraries(boost_coroutine PUBLIC boost::context)
target_link_libraries(boost_coroutine PUBLIC boost::config)
target_link_libraries(boost_coroutine PUBLIC boost::throw_exception)
target_link_libraries(boost_coroutine PUBLIC boost::utility)

target_sources(boost_coroutine PRIVATE src/detail/coroutine_context.cpp)
if(WIN32)
target_sources(boost_coroutine PRIVATE src/windows/stack_traits.cpp)
else()
target_sources(boost_coroutine PRIVATE src/posix/stack_traits.cpp)
endif()


target_include_directories(boost_coroutine PRIVATE include)

bcm_deploy(TARGETS boost_coroutine INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
