include(BCMTest)

find_package(boost_numeric_ublas)
find_package(boost_test)
find_package(boost_multiprecision)

bcm_test_link_libraries(boost_numeric_odeint
boost::numeric_ublas
boost::test
boost::multiprecision
)

# Copyright 2012-2013 Karsten Ahnert
# Copyright 2012-2013 Mario Mulansky
# Copyright 2013 Pascal Germroth
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing


# make sure you are using a new version of boost.build, otherwise the local
# odeint will not be included properly
# you can fix older boost.build versions by applying the patch provided in
# odeint's root, e.g.:
# cd ~/odeint-v2
# sudo patch /usr/share/boost-build/build/toolset.jam toolset.jam.patch


# use test library
# <cxxflags>-D_SCL_SECURE_NO_WARNINGS

# disable in clang
# bcm_test(NAME euler_stepper SOURCES euler_stepper.cpp)
# bcm_test(NAME runge_kutta_concepts SOURCES runge_kutta_concepts.cpp)
# bcm_test(NAME runge_kutta_error_concepts SOURCES runge_kutta_error_concepts.cpp)
# bcm_test(NAME runge_kutta_controlled_concepts SOURCES runge_kutta_controlled_concepts.cpp)
# bcm_test(NAME resizing SOURCES resizing.cpp)
bcm_test(NAME default_operations SOURCES default_operations.cpp)
bcm_test(NAME range_algebra SOURCES range_algebra.cpp)
# bcm_test(NAME implicit_euler SOURCES implicit_euler.cpp)
bcm_test(NAME fusion_algebra SOURCES fusion_algebra.cpp)
# bcm_test(NAME stepper_with_units SOURCES stepper_with_units.cpp)
# bcm_test(NAME stepper_copying SOURCES stepper_copying.cpp)
# bcm_test(NAME stepper_with_ranges SOURCES stepper_with_ranges.cpp)
# bcm_test(NAME rosenbrock4 SOURCES rosenbrock4.cpp)
# bcm_test(NAME rosenbrock4_mp SOURCES rosenbrock4_mp.cpp)
bcm_test(NAME is_pair SOURCES is_pair.cpp)
# bcm_test(NAME adams_bashforth SOURCES adams_bashforth.cpp)
# bcm_test(NAME adams_moulton SOURCES adams_moulton.cpp)
# bcm_test(NAME adams_bashforth_moulton SOURCES adams_bashforth_moulton.cpp)
# bcm_test(NAME generic_stepper SOURCES generic_stepper.cpp)
# bcm_test(NAME generic_error_stepper SOURCES generic_error_stepper.cpp)
# bcm_test(NAME bulirsch_stoer SOURCES bulirsch_stoer.cpp)
# bcm_test(NAME integrate_times SOURCES integrate_times.cpp)
# bcm_test(NAME integrate_times_iterator SOURCES integrate_times.cpp)
# target_compile_definitions(integrate_times_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# bcm_test(NAME integrate SOURCES integrate.cpp)
# bcm_test(NAME integrate_iterator SOURCES integrate.cpp)
# target_compile_definitions(integrate_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# bcm_test(NAME integrate_implicit SOURCES integrate_implicit.cpp)
# bcm_test(NAME integrate_implicit_iterator SOURCES integrate_implicit.cpp)
# target_compile_definitions(integrate_implicit_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# bcm_test(NAME generation SOURCES generation.cpp)
# bcm_test(NAME trivial_state SOURCES trivial_state.cpp)
bcm_test(NAME is_resizeable SOURCES is_resizeable.cpp)
bcm_test(NAME numeric_odeint_resize SOURCES resize.cpp)
bcm_test(NAME same_size SOURCES same_size.cpp)
bcm_test(NAME split SOURCES split.cpp)
# bcm_test(NAME symplectic_steppers SOURCES symplectic_steppers.cpp)
# bcm_test(NAME integrators_symplectic SOURCES integrators_symplectic.cpp)
# bcm_test(NAME integrators_symplectic_iterator SOURCES integrators_symplectic.cpp)
# target_compile_definitions(integrators_symplectic_iterator PUBLIC ODEINT_INTEGRATE_ITERATOR)
# bcm_test(NAME velocity_verlet SOURCES velocity_verlet.cpp)
# bcm_test(NAME multi_array SOURCES multi_array.cpp)
# bcm_test(NAME algebra_dispatcher SOURCES algebra_dispatcher.cpp COMPILE_ONLY)
bcm_test(NAME integrate_stepper_refs SOURCES integrate_stepper_refs.cpp)
bcm_test(NAME const_step_iterator SOURCES const_step_iterator.cpp)
bcm_test(NAME const_step_time_iterator SOURCES const_step_time_iterator.cpp)
bcm_test(NAME adaptive_iterator SOURCES adaptive_iterator.cpp)
bcm_test(NAME adaptive_time_iterator SOURCES adaptive_time_iterator.cpp)
bcm_test(NAME n_step_iterator SOURCES n_step_iterator.cpp)
bcm_test(NAME n_step_time_iterator SOURCES n_step_time_iterator.cpp)
bcm_test(NAME times_iterator SOURCES times_iterator.cpp)
bcm_test(NAME times_time_iterator SOURCES times_time_iterator.cpp)
# bcm_test(NAME step_size_limitation SOURCES step_size_limitation.cpp)
# bcm_test(NAME integrate_overflow SOURCES integrate_overflow.cpp)
bcm_test(NAME unwrap_boost_reference SOURCES unwrap_boost_reference.cpp COMPILE_ONLY)
bcm_test(NAME unwrap_reference_C++11 SOURCES unwrap_reference.cpp COMPILE_ONLY)
# bcm_test(NAME unwrap_reference_C++98 SOURCES unwrap_reference.cpp COMPILE_ONLY WILL_FAIL)
# bcm_test(NAME std_array SOURCES std_array.cpp COMPILE_ONLY)

# also run numeric tests


# test-suite "odeint-iterator_integrate"
#    :
#    [ run integrate.cpp : : : : integrate_iterator ]
#    : <testing.launcher>valgrind
#      <define>ODEINT_ITERATOR_INTEGRATE
#    ;


