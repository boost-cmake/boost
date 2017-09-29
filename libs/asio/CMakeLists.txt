cmake_minimum_required(VERSION 3.5)
project(boost_asio)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_date_time)
find_package(boost_coroutine)
find_package(boost_function)
find_package(boost_bind)
find_package(boost_chrono)
find_package(boost_system)
find_package(boost_regex)
find_package(boost_assert)
find_package(boost_core)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_array)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_asio INTERFACE
)
set_property(TARGET boost_asio PROPERTY EXPORT_NAME asio)

target_link_libraries(boost_asio INTERFACE boost::date_time)
target_link_libraries(boost_asio INTERFACE boost::coroutine)
target_link_libraries(boost_asio INTERFACE boost::function)
target_link_libraries(boost_asio INTERFACE boost::bind)
target_link_libraries(boost_asio INTERFACE boost::chrono)
target_link_libraries(boost_asio INTERFACE boost::system)
target_link_libraries(boost_asio INTERFACE boost::regex)
target_link_libraries(boost_asio INTERFACE boost::assert)
target_link_libraries(boost_asio INTERFACE boost::core)
target_link_libraries(boost_asio INTERFACE boost::type_traits)
target_link_libraries(boost_asio INTERFACE boost::smart_ptr)
target_link_libraries(boost_asio INTERFACE boost::array)
target_link_libraries(boost_asio INTERFACE boost::config)
target_link_libraries(boost_asio INTERFACE boost::throw_exception)

find_package(Threads)
target_link_libraries(boost_asio INTERFACE Threads::Threads)

find_package(OpenSSL)
if(OpenSSL_FOUND)
target_link_libraries(boost_asio INTERFACE OpenSSL::SSL)
endif()




bcm_deploy(TARGETS boost_asio INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
