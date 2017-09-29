cmake_minimum_required(VERSION 3.5)
project(boost_tokenizer)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_tokenizer INTERFACE
)
set_property(TARGET boost_tokenizer PROPERTY EXPORT_NAME tokenizer)

target_link_libraries(boost_tokenizer INTERFACE boost::iterator)
target_link_libraries(boost_tokenizer INTERFACE boost::mpl)
target_link_libraries(boost_tokenizer INTERFACE boost::assert)
target_link_libraries(boost_tokenizer INTERFACE boost::config)
target_link_libraries(boost_tokenizer INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_tokenizer INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
