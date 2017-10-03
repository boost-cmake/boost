cmake_minimum_required(VERSION 3.5)
project(boost_heap)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_intrusive)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_array)
find_package(boost_config)
find_package(boost_parameter)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_heap INTERFACE
)
set_property(TARGET boost_heap PROPERTY EXPORT_NAME heap)

target_link_libraries(boost_heap INTERFACE boost::static_assert)
target_link_libraries(boost_heap INTERFACE boost::iterator)
target_link_libraries(boost_heap INTERFACE boost::bind)
target_link_libraries(boost_heap INTERFACE boost::mpl)
target_link_libraries(boost_heap INTERFACE boost::intrusive)
target_link_libraries(boost_heap INTERFACE boost::assert)
target_link_libraries(boost_heap INTERFACE boost::type_traits)
target_link_libraries(boost_heap INTERFACE boost::concept_check)
target_link_libraries(boost_heap INTERFACE boost::array)
target_link_libraries(boost_heap INTERFACE boost::config)
target_link_libraries(boost_heap INTERFACE boost::parameter)
target_link_libraries(boost_heap INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_heap INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
