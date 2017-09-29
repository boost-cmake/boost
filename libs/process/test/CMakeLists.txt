include(BCMTest)

find_package(boost_thread)
find_package(boost_chrono)
find_package(boost_bind)
find_package(boost_range)
find_package(boost_program_options)
find_package(boost_test)
find_package(boost_lexical_cast)
find_package(boost_iostreams)
find_package(boost_lambda)

bcm_test_link_libraries(boost_process
boost::thread
boost::chrono
boost::bind
boost::range
boost::program_options
boost::test
boost::lexical_cast
boost::iostreams
boost::lambda
)

# Copyright (c) 2006, 2007 Julio M. Merino Vidal
# Copyright (c) 2008 Ilya Sokolov, Boris Schaeling
# Copyright (c) 2009 Boris Schaeling
# Copyright (c) 2010 Felipe Tanus, Boris Schaeling
# Copyright (c) 2011, 2012 Jeff Flinn, Boris Schaeling
# Copyright (c) 2016 Klemens D. Morgenstern
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)











add_library(multi_ref STATIC multi_ref1.cpp multi_ref2.cpp)
bcm_mark_as_test(multi_ref)
bcm_target_link_test_libs(multi_ref)

add_executable(sparring_partner sparring_partner.cpp)
bcm_mark_as_test(sparring_partner)
bcm_target_link_test_libs(sparring_partner)

add_executable(sub_launch sub_launcher.cpp)
bcm_mark_as_test(sub_launch)
bcm_target_link_test_libs(sub_launch)

bcm_test(NAME environment SOURCES environment.cpp)
bcm_test(NAME async_pipe SOURCES async_pipe.cpp)
bcm_test(NAME pipe SOURCES pipe.cpp)

bcm_test(NAME async SOURCES async.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME async_fut SOURCES async_fut.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME args_cmd SOURCES args_cmd.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME wargs_cmd SOURCES wargs_cmd.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME bind_stderr SOURCES bind_stderr.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME bind_stdin SOURCES bind_stdin.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME bind_stdin_stdout SOURCES bind_stdin_stdout.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME bind_stdout SOURCES bind_stdout.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME bind_stdout_stderr SOURCES bind_stdout_stderr.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME pipe_fwd SOURCES pipe_fwd.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME cmd_test SOURCES cmd_test.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME close_stderr SOURCES close_stderr.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME close_stdin SOURCES close_stdin.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME close_stdout SOURCES close_stdout.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME error SOURCES error.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME exit_code SOURCES exit_code.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME extensions SOURCES extensions.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME env SOURCES env.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME group SOURCES group.cpp ARGS $<TARGET_FILE:sub_launch>)
bcm_test(NAME run_exe SOURCES run_exe.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME run_exe_path SOURCES run_exe_path.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME search_path SOURCES search_path.cpp)
bcm_test(NAME shell SOURCES shell.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME shell_path SOURCES shell_path.cpp ARGS)
bcm_test(NAME async_system SOURCES async_system.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME system_test1 SOURCES system_test1.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME system_test2 SOURCES system_test2.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME spawn SOURCES spawn.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME start_dir SOURCES start_dir.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME terminate SOURCES terminate.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME throw_on_error SOURCES throw_on_error.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME wait SOURCES wait.cpp ARGS $<TARGET_FILE:sparring_partner>)
bcm_test(NAME spawn_fail SOURCES spawn_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME async_system_fail SOURCES async_system_fail.cpp COMPILE_ONLY WILL_FAIL)
if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
bcm_test(NAME posix_specific SOURCES posix_specific.cpp ARGS $<TARGET_FILE:sparring_partner>)
endif()
if(WIN32)
bcm_test(NAME windows_specific SOURCES windows_specific.cpp ARGS $<TARGET_FILE:sparring_partner>)
endif()

if(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    bcm_test(NAME vfork SOURCES vfork.cpp ARGS $<TARGET_FILE:sparring_partner>)
endif()




