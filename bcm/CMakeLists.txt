cmake_minimum_required (VERSION 3.5)

install(DIRECTORY share DESTINATION .)

enable_testing()
add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND} --output-on-failure -C ${CMAKE_CFG_INTDIR})
bcm_add_test_subdirectory()
