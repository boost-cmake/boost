include(BCMTest)

find_package(boost_variant)
find_package(boost_test)
find_package(boost_array)
find_package(boost_lexical_cast)
find_package(boost_utility)

bcm_test_link_libraries(boost_context
boost::variant
boost::test
boost::array
boost::lexical_cast
boost::utility
)

# Boost.Context Library Tests Jamfile

#          Copyright Oliver Kowalke 2009.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)







bcm_test(NAME test_invoke SOURCES test_invoke.cpp)
bcm_test(NAME test_apply SOURCES test_apply.cpp)
bcm_test(NAME test_fcontext SOURCES test_fcontext.cpp)
bcm_test(NAME test_execution_context SOURCES test_execution_context.cpp)
bcm_test(NAME test_callcc SOURCES test_callcc.cpp)




