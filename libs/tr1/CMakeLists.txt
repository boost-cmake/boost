cmake_minimum_required(VERSION 3.5)
project(boost_tr1)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_random)
find_package(boost_functional)
find_package(boost_regex)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_array)
find_package(boost_config)
find_package(boost_unordered)
find_package(boost_math)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_tr1 INTERFACE
)
set_property(TARGET boost_tr1 PROPERTY EXPORT_NAME tr1)

target_link_libraries(boost_tr1 INTERFACE boost::function)
target_link_libraries(boost_tr1 INTERFACE boost::core)
target_link_libraries(boost_tr1 INTERFACE boost::static_assert)
target_link_libraries(boost_tr1 INTERFACE boost::iterator)
target_link_libraries(boost_tr1 INTERFACE boost::tuple)
target_link_libraries(boost_tr1 INTERFACE boost::bind)
target_link_libraries(boost_tr1 INTERFACE boost::mpl)
target_link_libraries(boost_tr1 INTERFACE boost::random)
target_link_libraries(boost_tr1 INTERFACE boost::functional)
target_link_libraries(boost_tr1 INTERFACE boost::regex)
target_link_libraries(boost_tr1 INTERFACE boost::assert)
target_link_libraries(boost_tr1 INTERFACE boost::fusion)
target_link_libraries(boost_tr1 INTERFACE boost::type_traits)
target_link_libraries(boost_tr1 INTERFACE boost::smart_ptr)
target_link_libraries(boost_tr1 INTERFACE boost::array)
target_link_libraries(boost_tr1 INTERFACE boost::config)
target_link_libraries(boost_tr1 INTERFACE boost::unordered)
target_link_libraries(boost_tr1 INTERFACE boost::math)
target_link_libraries(boost_tr1 INTERFACE boost::utility)




bcm_deploy(TARGETS boost_tr1 INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
