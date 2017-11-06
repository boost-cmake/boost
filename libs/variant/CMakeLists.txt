cmake_minimum_required(VERSION 3.5)
project(boost_variant)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_move)
find_package(boost_detail)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_type_index)
find_package(boost_preprocessor)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_math)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_variant INTERFACE
)
set_property(TARGET boost_variant PROPERTY EXPORT_NAME variant)

target_link_libraries(boost_variant INTERFACE boost::core)
target_link_libraries(boost_variant INTERFACE boost::static_assert)
target_link_libraries(boost_variant INTERFACE boost::bind)
target_link_libraries(boost_variant INTERFACE boost::mpl)
target_link_libraries(boost_variant INTERFACE boost::move)
target_link_libraries(boost_variant INTERFACE boost::detail)
target_link_libraries(boost_variant INTERFACE boost::functional)
target_link_libraries(boost_variant INTERFACE boost::assert)
target_link_libraries(boost_variant INTERFACE boost::type_traits)
target_link_libraries(boost_variant INTERFACE boost::type_index)
target_link_libraries(boost_variant INTERFACE boost::preprocessor)
target_link_libraries(boost_variant INTERFACE boost::config)
target_link_libraries(boost_variant INTERFACE boost::throw_exception)
target_link_libraries(boost_variant INTERFACE boost::math)
target_link_libraries(boost_variant INTERFACE boost::utility)




bcm_deploy(TARGETS boost_variant INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
