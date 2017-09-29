cmake_minimum_required(VERSION 3.5)
project(boost_lexical_cast)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_container)
find_package(boost_mpl)
find_package(boost_array)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_numeric_conversion)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_math)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_lexical_cast INTERFACE
)
set_property(TARGET boost_lexical_cast PROPERTY EXPORT_NAME lexical_cast)

target_link_libraries(boost_lexical_cast INTERFACE boost::core)
target_link_libraries(boost_lexical_cast INTERFACE boost::static_assert)
target_link_libraries(boost_lexical_cast INTERFACE boost::container)
target_link_libraries(boost_lexical_cast INTERFACE boost::mpl)
target_link_libraries(boost_lexical_cast INTERFACE boost::array)
target_link_libraries(boost_lexical_cast INTERFACE boost::assert)
target_link_libraries(boost_lexical_cast INTERFACE boost::range)
target_link_libraries(boost_lexical_cast INTERFACE boost::type_traits)
target_link_libraries(boost_lexical_cast INTERFACE boost::numeric_conversion)
target_link_libraries(boost_lexical_cast INTERFACE boost::integer)
target_link_libraries(boost_lexical_cast INTERFACE boost::config)
target_link_libraries(boost_lexical_cast INTERFACE boost::throw_exception)
target_link_libraries(boost_lexical_cast INTERFACE boost::math)




bcm_deploy(TARGETS boost_lexical_cast INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
