cmake_minimum_required(VERSION 3.5)
project(boost_range)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_regex)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_functional)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_preprocessor)
find_package(boost_array)
find_package(boost_config)
find_package(boost_numeric_conversion)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_range INTERFACE
)
set_property(TARGET boost_range PROPERTY EXPORT_NAME range)

target_link_libraries(boost_range INTERFACE boost::regex)
target_link_libraries(boost_range INTERFACE boost::core)
target_link_libraries(boost_range INTERFACE boost::static_assert)
target_link_libraries(boost_range INTERFACE boost::iterator)
target_link_libraries(boost_range INTERFACE boost::tuple)
target_link_libraries(boost_range INTERFACE boost::optional)
target_link_libraries(boost_range INTERFACE boost::mpl)
target_link_libraries(boost_range INTERFACE boost::functional)
target_link_libraries(boost_range INTERFACE boost::detail)
target_link_libraries(boost_range INTERFACE boost::assert)
target_link_libraries(boost_range INTERFACE boost::type_traits)
target_link_libraries(boost_range INTERFACE boost::concept_check)
target_link_libraries(boost_range INTERFACE boost::preprocessor)
target_link_libraries(boost_range INTERFACE boost::array)
target_link_libraries(boost_range INTERFACE boost::config)
target_link_libraries(boost_range INTERFACE boost::numeric_conversion)
target_link_libraries(boost_range INTERFACE boost::utility)




bcm_deploy(TARGETS boost_range INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
