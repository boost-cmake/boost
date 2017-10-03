cmake_minimum_required(VERSION 3.5)
project(boost_algorithm)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_regex)
find_package(boost_core)
find_package(boost_exception)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_function)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_static_assert)
find_package(boost_unordered)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_array)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_algorithm INTERFACE
)
set_property(TARGET boost_algorithm PROPERTY EXPORT_NAME algorithm)

target_link_libraries(boost_algorithm INTERFACE boost::regex)
target_link_libraries(boost_algorithm INTERFACE boost::core)
target_link_libraries(boost_algorithm INTERFACE boost::exception)
target_link_libraries(boost_algorithm INTERFACE boost::iterator)
target_link_libraries(boost_algorithm INTERFACE boost::tuple)
target_link_libraries(boost_algorithm INTERFACE boost::function)
target_link_libraries(boost_algorithm INTERFACE boost::bind)
target_link_libraries(boost_algorithm INTERFACE boost::mpl)
target_link_libraries(boost_algorithm INTERFACE boost::static_assert)
target_link_libraries(boost_algorithm INTERFACE boost::unordered)
target_link_libraries(boost_algorithm INTERFACE boost::assert)
target_link_libraries(boost_algorithm INTERFACE boost::range)
target_link_libraries(boost_algorithm INTERFACE boost::type_traits)
target_link_libraries(boost_algorithm INTERFACE boost::concept_check)
target_link_libraries(boost_algorithm INTERFACE boost::array)
target_link_libraries(boost_algorithm INTERFACE boost::config)
target_link_libraries(boost_algorithm INTERFACE boost::throw_exception)




bcm_deploy(TARGETS boost_algorithm INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
