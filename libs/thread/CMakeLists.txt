cmake_minimum_required(VERSION 3.5)
project(boost_thread)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_predef)
find_package(boost_move)
find_package(boost_functional)
find_package(boost_concept_check)
find_package(boost_atomic)
find_package(boost_io)
find_package(boost_utility)
find_package(boost_static_assert)
find_package(boost_container)
find_package(boost_system)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_intrusive)
find_package(boost_config)
find_package(boost_function)
find_package(boost_core)
find_package(boost_tuple)
find_package(boost_winapi)
find_package(boost_mpl)
find_package(boost_assert)
find_package(boost_preprocessor)
find_package(boost_optional)
find_package(boost_date_time)
find_package(boost_exception)
find_package(boost_algorithm)
find_package(boost_chrono)
find_package(boost_bind)
find_package(boost_lexical_cast)
find_package(boost_throw_exception)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_thread 
src/future.cpp
src/tss_null.cpp
)
set_property(TARGET boost_thread PROPERTY EXPORT_NAME thread)

target_link_libraries(boost_thread PUBLIC boost::predef)
target_link_libraries(boost_thread PUBLIC boost::move)
target_link_libraries(boost_thread PUBLIC boost::functional)
target_link_libraries(boost_thread PUBLIC boost::concept_check)
target_link_libraries(boost_thread PUBLIC boost::atomic)
target_link_libraries(boost_thread PUBLIC boost::io)
target_link_libraries(boost_thread PUBLIC boost::utility)
target_link_libraries(boost_thread PUBLIC boost::static_assert)
target_link_libraries(boost_thread PUBLIC boost::container)
target_link_libraries(boost_thread PUBLIC boost::system)
target_link_libraries(boost_thread PUBLIC boost::type_traits)
target_link_libraries(boost_thread PUBLIC boost::smart_ptr)
target_link_libraries(boost_thread PUBLIC boost::intrusive)
target_link_libraries(boost_thread PUBLIC boost::config)
target_link_libraries(boost_thread PUBLIC boost::function)
target_link_libraries(boost_thread PUBLIC boost::core)
target_link_libraries(boost_thread PUBLIC boost::tuple)
target_link_libraries(boost_thread PUBLIC boost::winapi)
target_link_libraries(boost_thread PUBLIC boost::mpl)
target_link_libraries(boost_thread PUBLIC boost::assert)
target_link_libraries(boost_thread PUBLIC boost::preprocessor)
target_link_libraries(boost_thread PUBLIC boost::optional)
target_link_libraries(boost_thread PUBLIC boost::date_time)
target_link_libraries(boost_thread PUBLIC boost::exception)
target_link_libraries(boost_thread PUBLIC boost::algorithm)
target_link_libraries(boost_thread PUBLIC boost::chrono)
target_link_libraries(boost_thread PUBLIC boost::bind)
target_link_libraries(boost_thread PUBLIC boost::lexical_cast)
target_link_libraries(boost_thread PUBLIC boost::throw_exception)

find_package(Threads)
target_link_libraries(boost_thread PUBLIC Threads::Threads)

if(WIN32)
target_sources(boost_thread PRIVATE
    src/win32/thread.cpp
    src/win32/tss_dll.cpp
    src/win32/tss_pe.cpp
)
else()
target_sources(boost_thread PRIVATE
    src/pthread/thread.cpp
    src/pthread/once.cpp
)
endif()


target_include_directories(boost_thread PRIVATE include)

bcm_deploy(TARGETS boost_thread INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
