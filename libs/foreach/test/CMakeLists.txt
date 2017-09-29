include(BCMTest)

find_package(boost_test)

bcm_test_link_libraries(boost_foreach
boost::test
)

# (C) Copyright 2004: Eric Niebler
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# bring in rules for testing


bcm_test(NAME stl_byval SOURCES stl_byval.cpp)
bcm_test(NAME stl_byref SOURCES stl_byref.cpp)
bcm_test(NAME stl_byval_r SOURCES stl_byval_r.cpp)
bcm_test(NAME stl_byref_r SOURCES stl_byref_r.cpp)
bcm_test(NAME array_byval SOURCES array_byval.cpp)
bcm_test(NAME array_byref SOURCES array_byref.cpp)
bcm_test(NAME array_byval_r SOURCES array_byval_r.cpp)
bcm_test(NAME array_byref_r SOURCES array_byref_r.cpp)
bcm_test(NAME cstr_byval SOURCES cstr_byval.cpp)
bcm_test(NAME cstr_byref SOURCES cstr_byref.cpp)
bcm_test(NAME cstr_byval_r SOURCES cstr_byval_r.cpp)
bcm_test(NAME cstr_byref_r SOURCES cstr_byref_r.cpp)
bcm_test(NAME pair_byval SOURCES pair_byval.cpp)
bcm_test(NAME pair_byref SOURCES pair_byref.cpp)
bcm_test(NAME pair_byval_r SOURCES pair_byval_r.cpp)
bcm_test(NAME pair_byref_r SOURCES pair_byref_r.cpp)
bcm_test(NAME user_defined SOURCES user_defined.cpp)
bcm_test(NAME call_once SOURCES call_once.cpp)
bcm_test(NAME rvalue_const SOURCES rvalue_const.cpp)
bcm_test(NAME rvalue_nonconst SOURCES rvalue_nonconst.cpp)
bcm_test(NAME rvalue_const_r SOURCES rvalue_const_r.cpp)
bcm_test(NAME rvalue_nonconst_r SOURCES rvalue_nonconst_r.cpp)
bcm_test(NAME dependent_type SOURCES dependent_type.cpp)
bcm_test(NAME misc SOURCES misc.cpp)
bcm_test(NAME noncopyable SOURCES noncopyable.cpp COMPILE_ONLY)

