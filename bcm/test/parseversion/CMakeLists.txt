cmake_minimum_required (VERSION 3.5)
project(simple)

find_package(BCM)

include(BCMInstallTargets)
include(BCMDeploy)
include(BCMSetupVersion)
include(BCMTest)

bcm_setup_version(PARSE_HEADER include/version.h)

if(NOT "${PROJECT_VERSION}" STREQUAL "2.3.5")
    message(SEND_ERROR "Incorrect version was parsed: ${PROJECT_VERSION}")
endif()

add_library(simple INTERFACE)

bcm_install_targets(TARGETS simple INCLUDE include)

bcm_test(NAME simpletest SOURCES test.cpp)
target_link_libraries(simpletest simple)

bcm_test(NAME simpletestcompile SOURCES compiletest.cpp COMPILE_ONLY)
target_link_libraries(simpletestcompile simple)

bcm_test_header(NAME simpletestheader HEADER simple.h)
target_link_libraries(simpletestheader simple)

bcm_test_header(NAME simpleteststaticheader HEADER simple.h STATIC)
target_link_libraries(simpleteststaticheader simple)

