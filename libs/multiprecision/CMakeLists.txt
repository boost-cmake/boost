cmake_minimum_required(VERSION 3.5)
project(boost_multiprecision)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_mpl)
find_package(boost_random)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_rational)
find_package(boost_lexical_cast)
find_package(boost_integer)
find_package(boost_array)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_math)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_multiprecision INTERFACE
)
set_property(TARGET boost_multiprecision PROPERTY EXPORT_NAME multiprecision)

target_link_libraries(boost_multiprecision INTERFACE boost::core)
target_link_libraries(boost_multiprecision INTERFACE boost::static_assert)
target_link_libraries(boost_multiprecision INTERFACE boost::predef)
target_link_libraries(boost_multiprecision INTERFACE boost::mpl)
target_link_libraries(boost_multiprecision INTERFACE boost::random)
target_link_libraries(boost_multiprecision INTERFACE boost::functional)
target_link_libraries(boost_multiprecision INTERFACE boost::assert)
target_link_libraries(boost_multiprecision INTERFACE boost::type_traits)
target_link_libraries(boost_multiprecision INTERFACE boost::smart_ptr)
target_link_libraries(boost_multiprecision INTERFACE boost::rational)
target_link_libraries(boost_multiprecision INTERFACE boost::lexical_cast)
target_link_libraries(boost_multiprecision INTERFACE boost::integer)
target_link_libraries(boost_multiprecision INTERFACE boost::array)
target_link_libraries(boost_multiprecision INTERFACE boost::config)
target_link_libraries(boost_multiprecision INTERFACE boost::throw_exception)
target_link_libraries(boost_multiprecision INTERFACE boost::math)




bcm_deploy(TARGETS boost_multiprecision INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
