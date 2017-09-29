cmake_minimum_required(VERSION 3.5)
project(boost_type_erasure)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_thread)
find_package(boost_iterator)
find_package(boost_typeof)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_smart_ptr)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_type_erasure 
src/dynamic_binding.cpp
)
set_property(TARGET boost_type_erasure PROPERTY EXPORT_NAME type_erasure)

target_link_libraries(boost_type_erasure PUBLIC boost::core)
target_link_libraries(boost_type_erasure PUBLIC boost::thread)
target_link_libraries(boost_type_erasure PUBLIC boost::iterator)
target_link_libraries(boost_type_erasure PUBLIC boost::typeof)
target_link_libraries(boost_type_erasure PUBLIC boost::mpl)
target_link_libraries(boost_type_erasure PUBLIC boost::assert)
target_link_libraries(boost_type_erasure PUBLIC boost::fusion)
target_link_libraries(boost_type_erasure PUBLIC boost::type_traits)
target_link_libraries(boost_type_erasure PUBLIC boost::preprocessor)
target_link_libraries(boost_type_erasure PUBLIC boost::config)
target_link_libraries(boost_type_erasure PUBLIC boost::throw_exception)
target_link_libraries(boost_type_erasure PUBLIC boost::smart_ptr)



target_include_directories(boost_type_erasure PRIVATE include)

bcm_deploy(TARGETS boost_type_erasure INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
