cmake_minimum_required(VERSION 3.5)
project(boost_convert)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function_types)
find_package(boost_core)
find_package(boost_optional)
find_package(boost_mpl)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_lexical_cast)
find_package(boost_parameter)
find_package(boost_config)
find_package(boost_spirit)
find_package(boost_math)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_convert INTERFACE
)
set_property(TARGET boost_convert PROPERTY EXPORT_NAME convert)

target_link_libraries(boost_convert INTERFACE boost::function_types)
target_link_libraries(boost_convert INTERFACE boost::core)
target_link_libraries(boost_convert INTERFACE boost::optional)
target_link_libraries(boost_convert INTERFACE boost::mpl)
target_link_libraries(boost_convert INTERFACE boost::range)
target_link_libraries(boost_convert INTERFACE boost::type_traits)
target_link_libraries(boost_convert INTERFACE boost::lexical_cast)
target_link_libraries(boost_convert INTERFACE boost::parameter)
target_link_libraries(boost_convert INTERFACE boost::config)
target_link_libraries(boost_convert INTERFACE boost::spirit)
target_link_libraries(boost_convert INTERFACE boost::math)




bcm_deploy(TARGETS boost_convert INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
