cmake_minimum_required (VERSION 3.5)
project(basicapp)

find_package(BCM)

include(BCMInstallTargets)
include(BCMDeploy)
include(BCMTest)
include(BCMSetupVersion)

bcm_setup_version(VERSION 1.0)

find_package(simple)
add_executable(basicapp main.cpp)
target_link_libraries(basicapp simple)

bcm_install_targets(TARGETS basicapp)

bcm_test(NAME basciapptest SOURCES main.cpp)
target_link_libraries(basciapptest simple)

