include(BCMTest)

find_package(boost_foreach)
find_package(boost_rational)

bcm_test_link_libraries(boost_scope_exit
boost::foreach
boost::rational
)


# Copyright (C) 2006-2009, 2012 Alexander Nasonov
# Copyright (C) 2012 Lorenzo Caminiti
# Distributed under the Boost Software License, Version 1.0
# (see accompanying file LICENSE_1_0.txt or a copy at
# http://www.boost.org/LICENSE_1_0.txt)
# Home at http://www.boost.org/libs/scope_exit


# Sun does not automatically detect type-of emulation mode (force it).
# bcm_test(NAME $(target) SOURCES $(target).cpp)
# target_compile_definitions($(target) PUBLIC BOOST_TYPEOF_EMULATION)
# bcm_test(NAME $(target)_seq SOURCES $(target)_seq.cpp)
# target_compile_definitions($(target)_seq PUBLIC BOOST_TYPEOF_EMULATION)
# bcm_test(NAME $(target)_seq_nova SOURCES $(target)_seq_nova.cpp)
# target_compile_definitions($(target)_seq_nova PUBLIC BOOST_TYPEOF_EMULATION)

# bcm_test(NAME $(native_target) SOURCES $(native_target).cpp)
# target_compile_definitions($(native_target) PUBLIC BOOST_TYPEOF_NATIVE)
# bcm_test(NAME $(emulation_target) SOURCES $(native_target).cpp)
# target_compile_definitions($(emulation_target) PUBLIC BOOST_TYPEOF_EMULATION)

# bcm_test(NAME $(native_target) SOURCES $(native_target).cpp COMPILE_ONLY WILL_FAIL)
# target_compile_definitions($(native_target) PUBLIC BOOST_TYPEOF_NATIVE)
# bcm_test(NAME $(emulation_target) SOURCES $(native_target).cpp COMPILE_ONLY WILL_FAIL)
# target_compile_definitions($(emulation_target) PUBLIC BOOST_TYPEOF_EMULATION)

bcm_test(NAME world_void SOURCES world_void.cpp)
bcm_test(NAME world_void_nova SOURCES world_void_nova.cpp)

bcm_test(NAME native_tu_test SOURCES native_tu_test.cpp native_tu1.cpp native_tu2.cpp)
target_compile_definitions(native_tu_test PUBLIC BOOST_TYPEOF_NATIVE)
bcm_test(NAME emulation_tu_test SOURCES native_tu_test.cpp native_tu1.cpp native_tu2.cpp)
target_compile_definitions(emulation_tu_test PUBLIC BOOST_TYPEOF_EMULATION)


