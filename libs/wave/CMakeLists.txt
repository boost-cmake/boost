cmake_minimum_required(VERSION 3.5)
project(boost_wave)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_mpl)
find_package(boost_multi_index)
find_package(boost_spirit)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_preprocessor)
find_package(boost_filesystem)
find_package(boost_serialization)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_pool)
find_package(boost_smart_ptr)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_wave 
src/wave_config_constant.cpp
src/instantiate_cpp_grammar.cpp
src/instantiate_re2c_lexer_str.cpp
src/instantiate_cpp_literalgrs.cpp
src/token_ids.cpp
src/instantiate_re2c_lexer.cpp
src/instantiate_cpp_exprgrammar.cpp
src/instantiate_predef_macros.cpp
src/instantiate_defined_grammar.cpp
)
set_property(TARGET boost_wave PROPERTY EXPORT_NAME wave)

target_link_libraries(boost_wave PUBLIC boost::core)
target_link_libraries(boost_wave PUBLIC boost::static_assert)
target_link_libraries(boost_wave PUBLIC boost::iterator)
target_link_libraries(boost_wave PUBLIC boost::mpl)
target_link_libraries(boost_wave PUBLIC boost::multi_index)
target_link_libraries(boost_wave PUBLIC boost::spirit)
target_link_libraries(boost_wave PUBLIC boost::assert)
target_link_libraries(boost_wave PUBLIC boost::type_traits)
target_link_libraries(boost_wave PUBLIC boost::concept_check)
target_link_libraries(boost_wave PUBLIC boost::preprocessor)
target_link_libraries(boost_wave PUBLIC boost::filesystem)
target_link_libraries(boost_wave PUBLIC boost::serialization)
target_link_libraries(boost_wave PUBLIC boost::config)
target_link_libraries(boost_wave PUBLIC boost::throw_exception)
target_link_libraries(boost_wave PUBLIC boost::pool)
target_link_libraries(boost_wave PUBLIC boost::smart_ptr)



target_include_directories(boost_wave PRIVATE include)

bcm_deploy(TARGETS boost_wave INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
