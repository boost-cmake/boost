cmake_minimum_required (VERSION 3.5)
project(simple)

find_package(BCM)

include(BCMInstallTargets)
include(BCMDeploy)
include(BCMSetupVersion)
include(BCMTest)
include(BCMPkgConfig)

bcm_setup_version(VERSION 1.0 GENERATE_HEADER simpleversion.hpp)

find_package(Threads)

add_library(simple INTERFACE)
target_include_directories(simple INTERFACE $<INSTALL_INTERFACE:$<INSTALL_PREFIX>/include2>)
target_compile_definitions(simple INTERFACE -DSOME_DEFINE=1 -DHAS_SIMPLE=1 -DDEFINE_3=3)
target_link_libraries(simple INTERFACE Threads::Threads)
if(NOT MSVC)
target_compile_options(simple INTERFACE -std=c++0x)
endif()
bcm_test_link_libraries(simple)
install(FILES test.cpp DESTINATION include2)
bcm_deploy(TARGETS simple INCLUDE include)

bcm_test(NAME simpletest SOURCES test.cpp)

bcm_test(NAME simpletestcompile SOURCES compiletest.cpp COMPILE_ONLY)

bcm_test(NAME testwillfail SOURCES testwillfail.cpp WILL_FAIL)

bcm_test(NAME simpletestcompilewillfail SOURCES compiletestwillfail.cpp COMPILE_ONLY WILL_FAIL)

bcm_test_header(NAME simpletestheader HEADER simple.h)

bcm_test_header(NAME simpleteststaticheader HEADER simple.h STATIC)

add_library(simpletestinterface INTERFACE)
bcm_mark_as_test(simpletestinterface)

