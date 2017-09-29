include(BCMTest)

find_package(boost_functional)
find_package(boost_lexical_cast)

bcm_test_link_libraries(boost_type_index
boost::functional
boost::lexical_cast
)

# Copyright (C) 2012-2014 Antony Polukhin
#
# Distributed under the Boost Software License, Version 1.0. (See accompanying
# file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
#


# Variable that contains all the stuff required for linking together <rtti>on and <rtti>off

# Making own `nortti` that is link compatible.
# We explicitly define BOOST_NO_RTTI because it sometimes can not be detected by build system.



# Making libraries that CANNOT work between rtti-on/rtti-off modules
# add_library(test_lib_nortti STATIC test_lib_nortti-obj)
# bcm_mark_as_test(test_lib_nortti)
# add_library(test_lib_anonymous_nortti STATIC test_lib_anonymous_nortti-obj)
# bcm_mark_as_test(test_lib_anonymous_nortti)

# add_library(test_lib_rtti STATIC test_lib_rtti-obj)
# bcm_mark_as_test(test_lib_rtti)
# add_library(test_lib_anonymous_rtti STATIC test_lib_anonymous_rtti-obj)
# bcm_mark_as_test(test_lib_anonymous_rtti)

# Making libraries that can work between rtti-on/rtti-off modules
# add_library(test_lib_nortti_compat STATIC test_lib_nortti_compat-obj)
# bcm_mark_as_test(test_lib_nortti_compat)
# add_library(test_lib_rtti_compat STATIC test_lib_rtti_compat-obj)
# bcm_mark_as_test(test_lib_rtti_compat)




# Mixing RTTI on and off
# MSVC sometimes overrides the /GR-, without `detect_missmatch` this test may link
bcm_test(NAME type_index_test SOURCES type_index_test.cpp)
bcm_test(NAME type_index_runtime_cast_test SOURCES type_index_runtime_cast_test.cpp)
bcm_test(NAME type_index_constexpr_test SOURCES type_index_constexpr_test.cpp)
bcm_test(NAME type_index_test_no_rtti SOURCES type_index_test.cpp)
set_target_properties(type_index_test_no_rtti PROPERTIES CXX_RTTI off$(norttidefines))
bcm_test(NAME ctti_print_name SOURCES ctti_print_name.cpp)
# bcm_test(NAME testing_crossmodule SOURCES testing_crossmodule.cpp)
# bcm_test(NAME testing_crossmodule_no_rtti SOURCES testing_crossmodule.cpp)
# set_target_properties(testing_crossmodule_no_rtti PROPERTIES CXX_RTTI off)
# bcm_test(NAME testing_crossmodule_anonymous SOURCES testing_crossmodule_anonymous.cpp)
bcm_test(NAME compare_ctti_stl SOURCES compare_ctti_stl.cpp)
bcm_test(NAME type_index_test_ctti_copy_fail SOURCES type_index_test_ctti_copy_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_index_test_ctti_construct_fail SOURCES type_index_test_ctti_construct_fail.cpp COMPILE_ONLY WILL_FAIL)
bcm_test(NAME type_index_test_ctti_alignment SOURCES type_index_test_ctti_alignment.cpp COMPILE_ONLY)
# bcm_test(NAME link_fail_nortti_rtti SOURCES testing_crossmodule.cpp COMPILE_ONLY WILL_FAIL)
# bcm_test(NAME link_fail_rtti_nortti SOURCES testing_crossmodule.cpp COMPILE_ONLY WILL_FAIL)
# bcm_test(NAME testing_crossmodule_nortti_rtti_compat SOURCES testing_crossmodule.cpp)
# bcm_test(NAME testing_crossmodule_rtti_nortti_compat SOURCES testing_crossmodule.cpp)

# Assuring that examples compile and run. Adding sources from `examples` directory to the `type_index` test suite.
# RTTI on
# bcm_test(NAME $(p) SOURCES $(p))

# RTTI off
# bcm_test(NAME $(target_name) SOURCES $(p))
# set_target_properties($(target_name) PROPERTIES CXX_RTTI off$(norttidefines))


