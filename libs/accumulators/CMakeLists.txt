cmake_minimum_required(VERSION 3.5)
project(boost_accumulators)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_numeric_ublas)
find_package(boost_parameter)
find_package(boost_mpl)
find_package(boost_range)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_preprocessor)
find_package(boost_circular_buffer)
find_package(boost_array)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_numeric_conversion)
find_package(boost_typeof)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_accumulators INTERFACE
)
set_property(TARGET boost_accumulators PROPERTY EXPORT_NAME accumulators)

target_link_libraries(boost_accumulators INTERFACE boost::core)
target_link_libraries(boost_accumulators INTERFACE boost::static_assert)
target_link_libraries(boost_accumulators INTERFACE boost::iterator)
target_link_libraries(boost_accumulators INTERFACE boost::tuple)
target_link_libraries(boost_accumulators INTERFACE boost::numeric_ublas)
target_link_libraries(boost_accumulators INTERFACE boost::parameter)
target_link_libraries(boost_accumulators INTERFACE boost::mpl)
target_link_libraries(boost_accumulators INTERFACE boost::range)
target_link_libraries(boost_accumulators INTERFACE boost::assert)
target_link_libraries(boost_accumulators INTERFACE boost::fusion)
target_link_libraries(boost_accumulators INTERFACE boost::type_traits)
target_link_libraries(boost_accumulators INTERFACE boost::concept_check)
target_link_libraries(boost_accumulators INTERFACE boost::preprocessor)
target_link_libraries(boost_accumulators INTERFACE boost::circular_buffer)
target_link_libraries(boost_accumulators INTERFACE boost::array)
target_link_libraries(boost_accumulators INTERFACE boost::config)
target_link_libraries(boost_accumulators INTERFACE boost::throw_exception)
target_link_libraries(boost_accumulators INTERFACE boost::numeric_conversion)
target_link_libraries(boost_accumulators INTERFACE boost::typeof)




bcm_deploy(TARGETS boost_accumulators INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
