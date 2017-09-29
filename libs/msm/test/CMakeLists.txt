include(BCMTest)

find_package(boost_test)

bcm_test_link_libraries(boost_msm
boost::test
)

# test/Jamfile.v2 controls building of MSM Library unit tests
#
# Copyright (c) 2010 Christophe Henry
#
# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)



bcm_test(NAME Anonymous SOURCES Anonymous.cpp)
bcm_test(NAME AnonymousEuml SOURCES AnonymousEuml.cpp)
bcm_test(NAME CompositeEuml SOURCES CompositeEuml.cpp)
bcm_test(NAME CompositeMachine SOURCES CompositeMachine.cpp)
bcm_test(NAME Constructor SOURCES Constructor.cpp)
bcm_test(NAME Entries SOURCES Entries.cpp)
bcm_test(NAME History SOURCES History.cpp)
bcm_test(NAME OrthogonalDeferred SOURCES OrthogonalDeferred.cpp)
bcm_test(NAME OrthogonalDeferred2 SOURCES OrthogonalDeferred2.cpp)
bcm_test(NAME OrthogonalDeferredEuml SOURCES OrthogonalDeferredEuml.cpp)
bcm_test(NAME SimpleEuml SOURCES SimpleEuml.cpp)
bcm_test(NAME SimpleEuml2 SOURCES SimpleEuml2.cpp)
bcm_test(NAME SimpleInternal SOURCES SimpleInternal.cpp)
bcm_test(NAME SimpleInternalEuml SOURCES SimpleInternalEuml.cpp)
bcm_test(NAME SimpleInternalFunctors SOURCES SimpleInternalFunctors.cpp)
bcm_test(NAME SimpleMachine SOURCES SimpleMachine.cpp)
bcm_test(NAME SimpleWithFunctors SOURCES SimpleWithFunctors.cpp)
bcm_test(NAME Serialize SOURCES Serialize.cpp)
bcm_test(NAME SerializeWithHistory SOURCES SerializeWithHistory.cpp)
bcm_test(NAME SerializeSimpleEuml SOURCES SerializeSimpleEuml.cpp)
bcm_test(NAME TestConstructor SOURCES TestConstructor.cpp)


