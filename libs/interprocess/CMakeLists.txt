cmake_minimum_required(VERSION 3.5)
project(boost_interprocess)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_container)
find_package(boost_date_time)
find_package(boost_winapi)
find_package(boost_move)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_integer)
find_package(boost_intrusive)
find_package(boost_config)
find_package(boost_unordered)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_interprocess INTERFACE
)
set_property(TARGET boost_interprocess PROPERTY EXPORT_NAME interprocess)

target_link_libraries(boost_interprocess INTERFACE boost::core)
target_link_libraries(boost_interprocess INTERFACE boost::static_assert)
target_link_libraries(boost_interprocess INTERFACE boost::container)
target_link_libraries(boost_interprocess INTERFACE boost::date_time)
target_link_libraries(boost_interprocess INTERFACE boost::winapi)
target_link_libraries(boost_interprocess INTERFACE boost::move)
target_link_libraries(boost_interprocess INTERFACE boost::assert)
target_link_libraries(boost_interprocess INTERFACE boost::type_traits)
target_link_libraries(boost_interprocess INTERFACE boost::integer)
target_link_libraries(boost_interprocess INTERFACE boost::intrusive)
target_link_libraries(boost_interprocess INTERFACE boost::config)
target_link_libraries(boost_interprocess INTERFACE boost::unordered)

if("${CMAKE_SYSTEM_NAME}" MATCHES "Linux")
    target_link_libraries(boost_interprocess INTERFACE -lrt)
endif()
if(WIN32)
    target_link_libraries(boost_interprocess INTERFACE -lole32 -loleaut32 -lpsapi -ladvapi32)
endif()



bcm_deploy(TARGETS boost_interprocess INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
