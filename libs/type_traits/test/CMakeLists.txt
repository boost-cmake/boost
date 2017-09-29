include(BCMTest)

find_package(boost_function)
find_package(boost_mpl)
find_package(boost_move)

bcm_test_link_libraries(boost_type_traits
boost::function
boost::mpl
boost::move
)

include(BCMProperties)

# TODO: We currently need to prepend boost_type_traits_ to all the tests
# we add here, otherwise some of them will conflict with tests in other
# Boost libraries. This is madness!

# Wrapper around bcm_test to set our own warning levels
function(type_traits_add_test target)
  bcm_test(NAME ${target} ${ARGN})
  target_compile_options(${target} PRIVATE -Wall)
  set_target_properties(${target} PROPERTIES CXX_WARNINGS_AS_ERRORS On)
endfunction()

file(GLOB test_sources RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" *_test*.cpp)
foreach(source IN LISTS test_sources)
  string(REPLACE ".cpp" "" name "${source}")
  type_traits_add_test(boost_type_traits_${name} SOURCES ${source})
endforeach()

# These traits have both intrinsic support, and a std conforming version, test
# a version with intrinsics disabled for better code coverage:
set(intrinsic_tests has_nothrow_assign_test
                    has_nothrow_constr_test
                    has_nothrow_copy_test
                    is_nothrow_move_assignable_test
                    is_nothrow_move_constructible_test)
foreach(test IN LISTS intrinsic_tests)
  type_traits_add_test(boost_type_traits_${test}_no_intrinsics SOURCES ${test}.cpp)
  target_compile_definitions(boost_type_traits_${test}_no_intrinsics PRIVATE BOOST_TT_DISABLE_INTRINSICS)
endforeach()
