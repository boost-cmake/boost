cmake_minimum_required(VERSION 3.5)
project(boost_test)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_exception)
find_package(boost_iterator)
find_package(boost_algorithm)
find_package(boost_static_assert)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_detail)
find_package(boost_timer)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_optional)
find_package(boost_smart_ptr)
find_package(boost_io)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_numeric_conversion)
find_package(boost_preprocessor)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_prg_exec_monitor
    src/execution_monitor.cpp
    src/debug.cpp
    src/cpp_main.cpp
)

target_include_directories(boost_prg_exec_monitor PRIVATE include)

target_link_libraries(boost_prg_exec_monitor PUBLIC
  boost::algorithm
  boost::config
  boost::detail
  boost::concept_check
  boost::exception
  boost::function
  boost::type_traits
)
set_property(TARGET boost_prg_exec_monitor PROPERTY EXPORT_NAME prg_exec_monitor)

add_library(boost_test_exec_monitor STATIC
    src/compiler_log_formatter.cpp
    src/debug.cpp
    src/decorator.cpp
    src/execution_monitor.cpp
    src/framework.cpp
    src/plain_report_formatter.cpp
    src/progress_monitor.cpp
    src/results_collector.cpp
    src/results_reporter.cpp
    src/test_main.cpp
    src/test_tools.cpp
    src/test_tree.cpp
    src/unit_test_log.cpp
    src/unit_test_main.cpp
    src/unit_test_monitor.cpp
    src/unit_test_parameters.cpp
    src/junit_log_formatter.cpp
    src/xml_log_formatter.cpp
    src/xml_report_formatter.cpp
)
set_property(TARGET boost_test_exec_monitor PROPERTY EXPORT_NAME test_exec_monitor)

target_include_directories(boost_test_exec_monitor PRIVATE include)

target_link_libraries(boost_test_exec_monitor PUBLIC
  boost::numeric_conversion
  boost::algorithm
  boost::detail
  boost::concept_check
  boost::timer
  boost::function
  boost::type_traits
  boost::io
  boost::optional
)

add_library(boost_unit_test_framework
    src/compiler_log_formatter.cpp
    src/debug.cpp
    src/decorator.cpp
    src/execution_monitor.cpp
    src/framework.cpp
    src/plain_report_formatter.cpp
    src/progress_monitor.cpp
    src/results_collector.cpp
    src/results_reporter.cpp
    src/test_tools.cpp
    src/test_tree.cpp
    src/unit_test_log.cpp
    src/unit_test_main.cpp
    src/unit_test_monitor.cpp
    src/unit_test_parameters.cpp
    src/junit_log_formatter.cpp
    src/xml_log_formatter.cpp
    src/xml_report_formatter.cpp
)
set_property(TARGET boost_unit_test_framework PROPERTY EXPORT_NAME unit_test_framework)

target_include_directories(boost_unit_test_framework PRIVATE include)

target_link_libraries(boost_unit_test_framework PUBLIC
  boost::numeric_conversion
  boost::concept_check
  boost::detail
  boost::algorithm
  boost::timer
  boost::function
  boost::type_traits
  boost::iterator
  boost::io
  boost::optional
  boost::smart_ptr
)

add_library(boost::test ALIAS boost_unit_test_framework)
bcm_shadow_notify(boost::test)

bcm_deploy(TARGETS boost_prg_exec_monitor boost_test_exec_monitor boost_unit_test_framework INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
