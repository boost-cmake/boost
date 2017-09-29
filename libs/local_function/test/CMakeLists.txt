include(BCMTest)

find_package(boost_function)
find_package(boost_core)
find_package(boost_functional)
find_package(boost_concept_check)

bcm_test_link_libraries(boost_local_function
boost::function
boost::core
boost::functional
boost::concept_check
)


# Copyright (C) 2009-2012 Lorenzo Caminiti
# Distributed under the Boost Software License, Version 1.0
# (see accompanying file LICENSE_1_0.txt or a copy at
# http://www.boost.org/LICENSE_1_0.txt)
# Home at http://www.boost.org/libs/local_function


# Sun does not automatically detect type-of emulation mode (force it).



bcm_test(NAME ten_void SOURCES ten_void.cpp)
bcm_test(NAME ten_void_nova SOURCES ten_void_nova.cpp)


