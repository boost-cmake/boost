cmake_minimum_required(VERSION 3.5)
project(boost_process)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_asio)
find_package(boost_core)
find_package(boost_tokenizer)
find_package(boost_iterator)
find_package(boost_algorithm)
find_package(boost_optional)
find_package(boost_move)
find_package(boost_system)
find_package(boost_winapi)
find_package(boost_fusion)
find_package(boost_type_index)
find_package(boost_filesystem)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_process INTERFACE
)
set_property(TARGET boost_process PROPERTY EXPORT_NAME process)

target_link_libraries(boost_process INTERFACE boost::asio)
target_link_libraries(boost_process INTERFACE boost::core)
target_link_libraries(boost_process INTERFACE boost::tokenizer)
target_link_libraries(boost_process INTERFACE boost::iterator)
target_link_libraries(boost_process INTERFACE boost::algorithm)
target_link_libraries(boost_process INTERFACE boost::optional)
target_link_libraries(boost_process INTERFACE boost::move)
target_link_libraries(boost_process INTERFACE boost::system)
target_link_libraries(boost_process INTERFACE boost::winapi)
target_link_libraries(boost_process INTERFACE boost::fusion)
target_link_libraries(boost_process INTERFACE boost::type_index)
target_link_libraries(boost_process INTERFACE boost::filesystem)
target_link_libraries(boost_process INTERFACE boost::config)




bcm_deploy(TARGETS boost_process INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
