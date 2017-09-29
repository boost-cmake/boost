include(BCMTest)

find_package(boost_static_assert)

bcm_test_link_libraries(boost_typeof
boost::static_assert
)

# Copyright (C) 2006 Vladimir Prus
# Copyright (C) 2006 Arkadiy Vertleyb
# Use, modification and distribution is subject to the Boost Software
# License, Version 1.0. (http://www.boost.org/LICENSE_1_0.txt)

# Boost Typeof Library test Jamfile


# The special requirement is not ported yet.
#
#local rule special-requirements ( toolset variant : properties * )
#{
#    # Tru64/CXX6.5 hangs on most tests, so just turn it off completely.
#
#    if $(UNIX) && $(OS) = OSF
#    {
#        switch $(toolset)
#        {
#            case tru64cxx65* : properties =
#                [ replace-properties $(properties) : <build>no ] ;
#        }
#    }
#
#    return $(properties) ;
#}

# bcm_test(NAME $(source:B)_native SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_native PUBLIC BOOST_TYPEOF_NATIVE)
# bcm_test(NAME $(source:B)_emulation SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_emulation PUBLIC BOOST_TYPEOF_EMULATION)

#    for local t in [ set.difference [ glob *.cpp ] : odr1.cpp odr2.cpp ]
bcm_test(NAME odr_native SOURCES odr1.cpp)
target_compile_definitions(odr_native PUBLIC BOOST_TYPEOF_NATIVE)
bcm_test(NAME odr_emulation SOURCES odr1.cpp)
target_compile_definitions(odr_emulation PUBLIC BOOST_TYPEOF_EMULATION)
bcm_test(NAME odr_no_uns SOURCES odr_no_uns1.cpp)
target_compile_definitions(odr_no_uns PUBLIC BOOST_TYPEOF_EMULATION)


