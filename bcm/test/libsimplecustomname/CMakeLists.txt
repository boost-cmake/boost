cmake_minimum_required (VERSION 3.5)
project(libsimple)

find_package(BCM)

include(BCMInstallTargets)
include(BCMDeploy)
include(BCMSetupVersion)
include(BCMTest)

bcm_setup_version(VERSION 1.0 GENERATE_HEADER simpleversion.hpp)

add_library(simple INTERFACE)

bcm_install_targets(TARGETS simple INCLUDE include)
bcm_auto_export(TARGETS simple NAME simple)

bcm_test(NAME simpletest SOURCES test.cpp)
target_link_libraries(simpletest simple)

bcm_test(NAME simpletestcompile SOURCES compiletest.cpp COMPILE_ONLY)
target_link_libraries(simpletestcompile simple)

bcm_test_header(NAME simpletestheader HEADER simple.h)
target_link_libraries(simpletestheader simple)

bcm_test_header(NAME simpleteststaticheader HEADER simple.h STATIC)
target_link_libraries(simpleteststaticheader simple)

