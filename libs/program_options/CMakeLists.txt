cmake_minimum_required(VERSION 3.5)
project(boost_program_options)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_tokenizer)
find_package(boost_iterator)
find_package(boost_bind)
find_package(boost_detail)
find_package(boost_throw_exception)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_lexical_cast)
find_package(boost_config)
find_package(boost_any)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_program_options 
src/options_description.cpp
src/winmain.cpp
src/cmdline.cpp
src/convert.cpp
src/parsers.cpp
src/config_file.cpp
src/positional_options.cpp
src/value_semantic.cpp
src/split.cpp
src/variables_map.cpp
src/utf8_codecvt_facet.cpp
)
set_property(TARGET boost_program_options PROPERTY EXPORT_NAME program_options)

target_link_libraries(boost_program_options PUBLIC boost::function)
target_link_libraries(boost_program_options PUBLIC boost::core)
target_link_libraries(boost_program_options PUBLIC boost::static_assert)
target_link_libraries(boost_program_options PUBLIC boost::tokenizer)
target_link_libraries(boost_program_options PUBLIC boost::iterator)
target_link_libraries(boost_program_options PUBLIC boost::bind)
target_link_libraries(boost_program_options PUBLIC boost::detail)
target_link_libraries(boost_program_options PUBLIC boost::throw_exception)
target_link_libraries(boost_program_options PUBLIC boost::type_traits)
target_link_libraries(boost_program_options PUBLIC boost::smart_ptr)
target_link_libraries(boost_program_options PUBLIC boost::lexical_cast)
target_link_libraries(boost_program_options PUBLIC boost::config)
target_link_libraries(boost_program_options PUBLIC boost::any)



target_include_directories(boost_program_options PRIVATE include)

bcm_deploy(TARGETS boost_program_options INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
