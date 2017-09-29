cmake_minimum_required(VERSION 3.5)
project(boost_filesystem)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_functional)
find_package(boost_iterator)
find_package(boost_system)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_io)
find_package(boost_config)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_filesystem 
src/path_traits.cpp
src/portability.cpp
src/unique_path.cpp
src/path.cpp
src/windows_file_codecvt.cpp
src/operations.cpp
src/codecvt_error_category.cpp
src/utf8_codecvt_facet.cpp
)
set_property(TARGET boost_filesystem PROPERTY EXPORT_NAME filesystem)

target_link_libraries(boost_filesystem PUBLIC boost::core)
target_link_libraries(boost_filesystem PUBLIC boost::static_assert)
target_link_libraries(boost_filesystem PUBLIC boost::functional)
target_link_libraries(boost_filesystem PUBLIC boost::iterator)
target_link_libraries(boost_filesystem PUBLIC boost::system)
target_link_libraries(boost_filesystem PUBLIC boost::detail)
target_link_libraries(boost_filesystem PUBLIC boost::assert)
target_link_libraries(boost_filesystem PUBLIC boost::range)
target_link_libraries(boost_filesystem PUBLIC boost::type_traits)
target_link_libraries(boost_filesystem PUBLIC boost::smart_ptr)
target_link_libraries(boost_filesystem PUBLIC boost::io)
target_link_libraries(boost_filesystem PUBLIC boost::config)



target_include_directories(boost_filesystem PRIVATE include)

bcm_deploy(TARGETS boost_filesystem INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
