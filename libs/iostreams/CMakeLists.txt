cmake_minimum_required(VERSION 3.5)
project(boost_iostreams)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_regex)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_function)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_random)
find_package(boost_detail)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_smart_ptr)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_iostreams 
src/gzip.cpp
src/file_descriptor.cpp
src/mapped_file.cpp
)
set_property(TARGET boost_iostreams PROPERTY EXPORT_NAME iostreams)

target_link_libraries(boost_iostreams PUBLIC boost::regex)
target_link_libraries(boost_iostreams PUBLIC boost::core)
target_link_libraries(boost_iostreams PUBLIC boost::static_assert)
target_link_libraries(boost_iostreams PUBLIC boost::function)
target_link_libraries(boost_iostreams PUBLIC boost::bind)
target_link_libraries(boost_iostreams PUBLIC boost::mpl)
target_link_libraries(boost_iostreams PUBLIC boost::random)
target_link_libraries(boost_iostreams PUBLIC boost::detail)
target_link_libraries(boost_iostreams PUBLIC boost::assert)
target_link_libraries(boost_iostreams PUBLIC boost::range)
target_link_libraries(boost_iostreams PUBLIC boost::type_traits)
target_link_libraries(boost_iostreams PUBLIC boost::preprocessor)
target_link_libraries(boost_iostreams PUBLIC boost::smart_ptr)
target_link_libraries(boost_iostreams PUBLIC boost::integer)
target_link_libraries(boost_iostreams PUBLIC boost::config)
target_link_libraries(boost_iostreams PUBLIC boost::throw_exception)
target_link_libraries(boost_iostreams PUBLIC boost::utility)

find_package(ZLIB)
find_package(BZip2)

if(ZLIB_FOUND)
target_link_libraries(boost_iostreams PUBLIC ZLIB::ZLIB)
target_sources(boost_iostreams PRIVATE src/zlib.cpp)
endif()

if(BZip2_FOUND)
target_link_libraries(boost_iostreams PUBLIC BZip2::BZip2)
target_sources(boost_iostreams PRIVATE src/bzip2.cpp)
endif()


target_include_directories(boost_iostreams PRIVATE include)

bcm_deploy(TARGETS boost_iostreams INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
