cmake_minimum_required(VERSION 3.5)
project(boost_regex)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_predef)
find_package(boost_mpl)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_smart_ptr)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_regex 
src/w32_regex_traits.cpp
src/wide_posix_api.cpp
src/regex_debug.cpp
src/winstances.cpp
src/regex_raw_buffer.cpp
src/cregex.cpp
src/instances.cpp
src/static_mutex.cpp
src/wc_regex_traits.cpp
src/icu.cpp
src/posix_api.cpp
src/fileiter.cpp
src/regex_traits_defaults.cpp
src/c_regex_traits.cpp
src/regex.cpp
src/usinstances.cpp
src/cpp_regex_traits.cpp
)
set_property(TARGET boost_regex PROPERTY EXPORT_NAME regex)

target_link_libraries(boost_regex PUBLIC boost::core)
target_link_libraries(boost_regex PUBLIC boost::static_assert)
target_link_libraries(boost_regex PUBLIC boost::iterator)
target_link_libraries(boost_regex PUBLIC boost::predef)
target_link_libraries(boost_regex PUBLIC boost::mpl)
target_link_libraries(boost_regex PUBLIC boost::functional)
target_link_libraries(boost_regex PUBLIC boost::assert)
target_link_libraries(boost_regex PUBLIC boost::type_traits)
target_link_libraries(boost_regex PUBLIC boost::concept_check)
target_link_libraries(boost_regex PUBLIC boost::smart_ptr)
target_link_libraries(boost_regex PUBLIC boost::integer)
target_link_libraries(boost_regex PUBLIC boost::config)
target_link_libraries(boost_regex PUBLIC boost::throw_exception)



target_include_directories(boost_regex PRIVATE include)

bcm_deploy(TARGETS boost_regex INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
