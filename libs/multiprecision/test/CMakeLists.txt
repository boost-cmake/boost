include(BCMTest)

find_package(boost_algorithm)
find_package(boost_chrono)
find_package(boost_exception)
find_package(boost_timer)
find_package(boost_numeric_ublas)
find_package(boost_filesystem)
find_package(boost_test)
find_package(boost_serialization)
find_package(boost_numeric_interval)

bcm_test_link_libraries(boost_multiprecision
boost::algorithm
boost::chrono
boost::exception
boost::timer
boost::numeric_ublas
boost::filesystem
boost::test
boost::serialization
boost::numeric_interval
)

# copyright John Maddock 2011
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt.

# HACK: Workaround broken includes
file(GLOB TEST_HEADERS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.hpp *.ipp)
foreach(HEADER ${TEST_HEADERS})
configure_file(${HEADER} ${CMAKE_CURRENT_BINARY_DIR}/include/libs/multiprecision/test/${HEADER} @ONLY)
endforeach()

add_library(multiprecision_test_settings INTERFACE)
target_include_directories(multiprecision_test_settings INTERFACE ${CMAKE_CURRENT_BINARY_DIR}/include)

bcm_test_link_libraries(multiprecision_test_settings)

# We set these to make it easier to set up and test GMP and MPFR under Win32:
# Speed up compiles:
# We can't yet enable this - it breaks the STL in some tests...
#<toolset>msvc,<optimization>off:<cxxflags>-RTCc
#<toolset>msvc,<optimization>off:<define>_ALLOW_RTCc_IN_STL

add_library(no_eh_support STATIC no_eh_test_support.cpp)
bcm_mark_as_test(no_eh_support)
target_link_libraries(no_eh_support boost_throw_exception)
bcm_target_link_test_libs(no_eh_support)

bcm_test(NAME test_arithmetic_backend_concept SOURCES test_arithmetic_backend_concept.cpp)

bcm_test(NAME test_arithmetic_cpp_dec_float_1 SOURCES test_arithmetic_cpp_dec_float_1.cpp)
bcm_test(NAME test_arithmetic_cpp_dec_float_2 SOURCES test_arithmetic_cpp_dec_float_2.cpp)
bcm_test(NAME test_arithmetic_cpp_dec_float_3 SOURCES test_arithmetic_cpp_dec_float_3.cpp)

bcm_test(NAME test_arithmetic_cpp_bin_float_1 SOURCES test_arithmetic_cpp_bin_float_1.cpp)
bcm_test(NAME test_arithmetic_cpp_bin_float_2 SOURCES test_arithmetic_cpp_bin_float_2.cpp)
bcm_test(NAME test_arithmetic_cpp_bin_float_3 SOURCES test_arithmetic_cpp_bin_float_3.cpp)

# bcm_test(NAME test_arithmetic_mpf_50 SOURCES test_arithmetic_mpf_50.cpp)
# bcm_test(NAME test_arithmetic_mpf SOURCES test_arithmetic_mpf.cpp)
# bcm_test(NAME test_arithmetic_mpz SOURCES test_arithmetic_mpz.cpp)
# bcm_test(NAME test_arithmetic_mpz_rat SOURCES test_arithmetic_mpz_rat.cpp)
# bcm_test(NAME test_arithmetic_mpz_br SOURCES test_arithmetic_mpz_br.cpp)
# bcm_test(NAME test_arithmetic_mpq SOURCES test_arithmetic_mpq.cpp)

# bcm_test(NAME test_arithmetic_mpfr SOURCES test_arithmetic_mpfr.cpp)
# bcm_test(NAME test_arithmetic_mpfr_50 SOURCES test_arithmetic_mpfr_50.cpp)
# bcm_test(NAME test_arithmetic_mpfr_50_static SOURCES test_arithmetic_mpfr_50_static.cpp)

# bcm_test(NAME test_arithmetic_tommath SOURCES test_arithmetic_tommath.cpp)
# bcm_test(NAME test_arithmetic_tommath_rat SOURCES test_arithmetic_tommath_rat.cpp)
# bcm_test(NAME test_arithmetic_tommath_br SOURCES test_arithmetic_tommath_br.cpp)

bcm_test(NAME test_arithmetic_cpp_int_1 SOURCES test_arithmetic_cpp_int_1.cpp)
bcm_test(NAME test_arithmetic_cpp_int_2 SOURCES test_arithmetic_cpp_int_2.cpp)
bcm_test(NAME test_arithmetic_cpp_int_3 SOURCES test_arithmetic_cpp_int_3.cpp)
bcm_test(NAME test_arithmetic_cpp_int_4 SOURCES test_arithmetic_cpp_int_4.cpp)
bcm_test(NAME test_arithmetic_cpp_int_5 SOURCES test_arithmetic_cpp_int_5.cpp)
bcm_test(NAME test_arithmetic_cpp_int_6 SOURCES test_arithmetic_cpp_int_6.cpp)
bcm_test(NAME test_arithmetic_cpp_int_7 SOURCES test_arithmetic_cpp_int_7.cpp)
bcm_test(NAME test_arithmetic_cpp_int_8 SOURCES test_arithmetic_cpp_int_8.cpp)
bcm_test(NAME test_arithmetic_cpp_int_9 SOURCES test_arithmetic_cpp_int_9.cpp)
bcm_test(NAME test_arithmetic_cpp_int_10 SOURCES test_arithmetic_cpp_int_10.cpp)
bcm_test(NAME test_arithmetic_cpp_int_11 SOURCES test_arithmetic_cpp_int_11.cpp)
bcm_test(NAME test_arithmetic_cpp_int_12 SOURCES test_arithmetic_cpp_int_12.cpp)
bcm_test(NAME test_arithmetic_cpp_int_13 SOURCES test_arithmetic_cpp_int_13.cpp)
bcm_test(NAME test_arithmetic_cpp_int_14 SOURCES test_arithmetic_cpp_int_14.cpp)
bcm_test(NAME test_arithmetic_cpp_int_15 SOURCES test_arithmetic_cpp_int_15.cpp)
bcm_test(NAME test_arithmetic_cpp_int_16 SOURCES test_arithmetic_cpp_int_16.cpp)
bcm_test(NAME test_arithmetic_cpp_int_17 SOURCES test_arithmetic_cpp_int_17.cpp)
bcm_test(NAME test_arithmetic_cpp_int_18 SOURCES test_arithmetic_cpp_int_18.cpp)
bcm_test(NAME test_arithmetic_cpp_int_br SOURCES test_arithmetic_cpp_int_br.cpp)

bcm_test(NAME test_arithmetic_ab_1 SOURCES test_arithmetic_ab_1.cpp)
bcm_test(NAME test_arithmetic_ab_2 SOURCES test_arithmetic_ab_2.cpp)
bcm_test(NAME test_arithmetic_ab_3 SOURCES test_arithmetic_ab_3.cpp)

bcm_test(NAME test_cpp_dec_float_round SOURCES test_cpp_dec_float_round.cpp)

bcm_test(NAME test_arithmetic_logged_1 SOURCES test_arithmetic_logged_1.cpp)
bcm_test(NAME test_arithmetic_logged_2 SOURCES test_arithmetic_logged_2.cpp)

bcm_test(NAME test_arithmetic_dbg_adptr1 SOURCES test_arithmetic_dbg_adptr1.cpp)
bcm_test(NAME test_arithmetic_dbg_adptr2 SOURCES test_arithmetic_dbg_adptr2.cpp)

# bcm_test(NAME test_arithmetic_mpfi_50 SOURCES test_arithmetic_mpfi_50.cpp)

# bcm_test(NAME test_arithmetic_float_128 SOURCES test_arithmetic_float_128.cpp)
# bcm_test(NAME test_arithmetic_intel_quad SOURCES test_arithmetic_float_128.cpp)

bcm_test(NAME test_numeric_limits_backend_concept SOURCES test_numeric_limits.cpp)
target_compile_definitions(test_numeric_limits_backend_concept PUBLIC TEST_BACKEND)

# bcm_test(NAME test_numeric_limits_mpf50 SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_mpf50 PUBLIC TEST_MPF_50)

# bcm_test(NAME test_numeric_limits_mpf SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_mpf PUBLIC TEST_MPF)

# bcm_test(NAME test_numeric_limits_mpz SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_mpz PUBLIC TEST_MPZ)

# bcm_test(NAME test_numeric_limits_mpq SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_mpq PUBLIC TEST_MPQ)

# bcm_test(NAME test_numeric_limits_mpfr SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_mpfr PUBLIC TEST_MPFR)

# bcm_test(NAME test_numeric_limits_mpfr_50 SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_mpfr_50 PUBLIC TEST_MPFR_50)

bcm_test(NAME test_numeric_limits_cpp_dec_float SOURCES test_numeric_limits.cpp)
target_compile_definitions(test_numeric_limits_cpp_dec_float PUBLIC TEST_CPP_DEC_FLOAT)

bcm_test(NAME test_numeric_limits_cpp_bin_float SOURCES test_numeric_limits.cpp)
target_compile_definitions(test_numeric_limits_cpp_bin_float PUBLIC TEST_CPP_BIN_FLOAT)

# bcm_test(NAME test_numeric_limits_tommath SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_tommath PUBLIC TEST_TOMMATH)

bcm_test(NAME test_numeric_limits_cpp_int SOURCES test_numeric_limits.cpp)
target_compile_definitions(test_numeric_limits_cpp_int PUBLIC TEST_CPP_INT)

# bcm_test(NAME test_numeric_limits_mpfi_50 SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_mpfi_50 PUBLIC TEST_MPFI_50)


# bcm_test(NAME test_numeric_limits_float128 SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_float128 PUBLIC TEST_FLOAT128)
# bcm_test(NAME test_numeric_limits_intel_quad SOURCES test_numeric_limits.cpp)
# target_compile_definitions(test_numeric_limits_intel_quad PUBLIC TEST_FLOAT128)

# bcm_test(NAME $(source:B)_mpf50 SOURCES $(source))
# target_compile_definitions($(source:B)_mpf50 PUBLIC TEST_MPF_50)
# bcm_test(NAME $(source:B)_mpfr50 SOURCES $(source))
# target_compile_definitions($(source:B)_mpfr50 PUBLIC TEST_MPFR_50)
# bcm_test(NAME $(source:B)_mpfi50 SOURCES $(source))
# target_compile_definitions($(source:B)_mpfi50 PUBLIC TEST_MPFI_50)
# bcm_test(NAME $(source:B)_cpp_dec_float SOURCES $(source))
# target_compile_definitions($(source:B)_cpp_dec_float PUBLIC TEST_CPP_DEC_FLOAT)
# bcm_test(NAME $(source:B)_cpp_bin_float SOURCES $(source))
# target_compile_definitions($(source:B)_cpp_bin_float PUBLIC TEST_CPP_BIN_FLOAT)
# bcm_test(NAME $(source:B)_float128 SOURCES $(source))
# target_compile_definitions($(source:B)_float128 PUBLIC TEST_FLOAT128)
# bcm_test(NAME $(source:B)_intel_quad SOURCES $(source))
# target_compile_definitions($(source:B)_intel_quad PUBLIC TEST_FLOAT128)

# bcm_test(NAME test_gmp_conversions SOURCES test_gmp_conversions.cpp)

# bcm_test(NAME test_mpfr_conversions SOURCES test_mpfr_conversions.cpp)

# bcm_test(NAME test_constants_mpf50 SOURCES test_constants.cpp)
# target_compile_definitions(test_constants_mpf50 PUBLIC TEST_MPF_50)

# bcm_test(NAME test_constants_mpfr_50 SOURCES test_constants.cpp)
# target_compile_definitions(test_constants_mpfr_50 PUBLIC TEST_MPFR_50)

bcm_test(NAME test_constants_cpp_dec_float SOURCES test_constants.cpp)
target_compile_definitions(test_constants_cpp_dec_float PUBLIC TEST_CPP_DEC_FLOAT)


# TODO: Check for gmp or mpft
# bcm_test(NAME test_move_mpfr SOURCES test_move.cpp)
# target_compile_definitions(test_move_mpfr PUBLIC TEST_MPFR)

# bcm_test(NAME test_move_gmp SOURCES test_move.cpp)
# target_compile_definitions(test_move_gmp PUBLIC TEST_GMP)

# bcm_test(NAME test_move_tommath SOURCES test_move.cpp)
# target_compile_definitions(test_move_tommath PUBLIC TEST_TOMMATH)

bcm_test(NAME test_move_cpp_int SOURCES test_move.cpp)
target_compile_definitions(test_move_cpp_int PUBLIC TEST_CPP_INT)

bcm_test(NAME test_test SOURCES test_test.cpp)
bcm_test(NAME test_cpp_int_lit SOURCES test_cpp_int_lit.cpp)
bcm_test(NAME test_constexpr SOURCES test_constexpr.cpp COMPILE_ONLY)

bcm_test(NAME test_nothrow_cpp_int SOURCES test_nothrow_cpp_int.cpp COMPILE_ONLY)
bcm_test(NAME test_nothrow_cpp_rational SOURCES test_nothrow_cpp_rational.cpp COMPILE_ONLY)
bcm_test(NAME test_nothrow_cpp_bin_float SOURCES test_nothrow_cpp_bin_float.cpp COMPILE_ONLY)
bcm_test(NAME test_nothrow_cpp_dec_float SOURCES test_nothrow_cpp_dec_float.cpp COMPILE_ONLY)
# bcm_test(NAME test_nothrow_float128 SOURCES test_nothrow_float128.cpp COMPILE_ONLY)
# bcm_test(NAME test_nothrow_gmp SOURCES test_nothrow_gmp.cpp COMPILE_ONLY)
# bcm_test(NAME test_nothrow_mpfr SOURCES test_nothrow_mpfr.cpp COMPILE_ONLY)

#
# Interconversion tests:
#
bcm_test(NAME test_convert_from_cpp_int SOURCES test_convert_from_cpp_int.cpp)
# bcm_test(NAME test_convert_from_mpz_int SOURCES test_convert_from_mpz_int.cpp)
# bcm_test(NAME test_convert_from_tom_int SOURCES test_convert_from_tom_int.cpp)
bcm_test(NAME test_convert_from_cpp_rational SOURCES test_convert_from_cpp_rational.cpp)
# bcm_test(NAME test_convert_from_gmp_rational SOURCES test_convert_from_gmp_rational.cpp)
# bcm_test(NAME test_convert_from_tom_rational SOURCES test_convert_from_tom_rational.cpp)
bcm_test(NAME test_convert_from_cpp_bin_float SOURCES test_convert_from_cpp_bin_float.cpp)
bcm_test(NAME test_convert_from_cpp_dec_float SOURCES test_convert_from_cpp_dec_float.cpp)
# bcm_test(NAME test_convert_from_mpf_float SOURCES test_convert_from_mpf_float.cpp)
# bcm_test(NAME test_convert_from_mpfr_float SOURCES test_convert_from_mpfr_float.cpp)
# bcm_test(NAME test_convert_from_mpfi_float SOURCES test_convert_from_mpfi_float.cpp)
# bcm_test(NAME test_convert_from_float128 SOURCES test_convert_from_float128.cpp)

#
# This take too long to run as a regular part of the tests:
#
# bcm_test(NAME test_cpp_bin_float_round SOURCES test_cpp_bin_float_round.cpp)

bcm_test(NAME test_cpp_bin_float_conv SOURCES test_cpp_bin_float_conv.cpp)

bcm_test(NAME test_cpp_bin_float_io_1 SOURCES test_cpp_bin_float_io.cpp)
target_compile_definitions(test_cpp_bin_float_io_1 PUBLIC TEST1release)

bcm_test(NAME test_cpp_bin_float_io_2 SOURCES test_cpp_bin_float_io.cpp)
target_compile_definitions(test_cpp_bin_float_io_2 PUBLIC TEST2release)

bcm_test(NAME test_cpp_bin_float SOURCES test_cpp_bin_float.cpp)
target_compile_definitions(test_cpp_bin_float PUBLIC TEST_MPFRrelease)

# bcm_test(NAME test_float_io_cpp_dec_float SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_cpp_dec_float PUBLIC TEST_CPP_DEC_FLOATrelease)

# bcm_test(NAME test_float_io_mpf SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_mpf PUBLIC TEST_MPF_50release)

# bcm_test(NAME test_float_io_mpfr SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_mpfr PUBLIC TEST_MPFR_50release)

# bcm_test(NAME test_float_io_mpfi SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_mpfi PUBLIC TEST_MPFI_50release)

# bcm_test(NAME test_float_io_float128 SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_float128 PUBLIC TEST_FLOAT128release)
# bcm_test(NAME test_float_io_intel_quad SOURCES test_float_io.cpp)
# target_compile_definitions(test_float_io_intel_quad PUBLIC TEST_FLOAT128release)

# bcm_test(NAME test_int_io_tommath SOURCES test_int_io.cpp)
# target_compile_definitions(test_int_io_tommath PUBLIC TEST_TOMMATHrelease)

# bcm_test(NAME test_int_io_mpz SOURCES test_int_io.cpp)
# target_compile_definitions(test_int_io_mpz PUBLIC TEST_MPZrelease)

# bcm_test(NAME test_int_io_cpp_int SOURCES test_int_io.cpp)
# target_compile_definitions(test_int_io_cpp_int PUBLIC TEST_CPP_INTrelease)

# bcm_test(NAME test_cpp_int_left_shift SOURCES test_cpp_int_left_shift.cpp)

# bcm_test(NAME test_cpp_int_1 SOURCES test_cpp_int.cpp)
# target_compile_definitions(test_cpp_int_1 PUBLIC TEST1)

# bcm_test(NAME test_cpp_int_2 SOURCES test_cpp_int.cpp)
# target_compile_definitions(test_cpp_int_2 PUBLIC TEST2)

# bcm_test(NAME test_cpp_int_3 SOURCES test_cpp_int.cpp)
# target_compile_definitions(test_cpp_int_3 PUBLIC TEST3)

# bcm_test(NAME test_cpp_int_4 SOURCES test_cpp_int.cpp)
# target_compile_definitions(test_cpp_int_4 PUBLIC TEST4)

# bcm_test(NAME test_cpp_int_5 SOURCES test_cpp_int.cpp)
# target_compile_definitions(test_cpp_int_5 PUBLIC TEST5)

bcm_test(NAME test_checked_cpp_int SOURCES test_checked_cpp_int.cpp)

# bcm_test(NAME test_miller_rabin SOURCES test_miller_rabin.cpp)

# bcm_test(NAME test_rational_io_tommath SOURCES test_rational_io.cpp)
# target_compile_definitions(test_rational_io_tommath PUBLIC TEST_TOMMATHrelease)

# bcm_test(NAME test_rational_io_mpz SOURCES test_rational_io.cpp)
# target_compile_definitions(test_rational_io_mpz PUBLIC TEST_MPQrelease)

# bcm_test(NAME test_rational_io_cpp_int SOURCES test_rational_io.cpp)
# target_compile_definitions(test_rational_io_cpp_int PUBLIC TEST_CPP_INTrelease)

# bcm_test(NAME test_generic_conv SOURCES test_generic_conv.cpp)

# bcm_test(NAME test_rat_float_interconv_1 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_1 PUBLIC TEST1release)

# bcm_test(NAME test_rat_float_interconv_2 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_2 PUBLIC TEST2release)

# bcm_test(NAME test_rat_float_interconv_3 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_3 PUBLIC TEST3release)

# bcm_test(NAME test_rat_float_interconv_4 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_4 PUBLIC TEST4release)

# bcm_test(NAME test_rat_float_interconv_5 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_5 PUBLIC TEST5release)

# bcm_test(NAME test_rat_float_interconv_6 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_6 PUBLIC TEST6release)

# bcm_test(NAME test_rat_float_interconv_7 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_7 PUBLIC TEST7release)

# bcm_test(NAME test_rat_float_interconv_8 SOURCES test_rat_float_interconv.cpp)
# target_compile_definitions(test_rat_float_interconv_8 PUBLIC TEST8release)



bcm_test(NAME test_cpp_int_conv SOURCES test_cpp_int_conv.cpp)
bcm_test(NAME test_cpp_int_import_export SOURCES test_cpp_int_import_export.cpp)
bcm_test(NAME test_native_integer SOURCES test_native_integer.cpp)

bcm_test(NAME test_mixed_cpp_int SOURCES test_mixed_cpp_int.cpp)
bcm_test(NAME test_mixed_float SOURCES test_mixed_float.cpp)


# bcm_test(NAME include_test_mpfr_include_test SOURCES include_test/mpfr_include_test.cpp COMPILE_ONLY)
# bcm_test(NAME include_test_gmp_include_test SOURCES include_test/gmp_include_test.cpp COMPILE_ONLY)
# bcm_test(NAME include_test_tommath_include_test SOURCES include_test/tommath_include_test.cpp COMPILE_ONLY)
# bcm_test(NAME include_test_cpp_int_include_test SOURCES include_test/cpp_int_include_test.cpp COMPILE_ONLY)
# bcm_test(NAME include_test_cpp_dec_float_include_test SOURCES include_test/cpp_dec_float_include_test.cpp COMPILE_ONLY)
# bcm_test(NAME include_test_cpp_bin_float_include_test SOURCES include_test/cpp_bin_float_include_test.cpp COMPILE_ONLY)

# bcm_test(NAME ublas_interop_test1 SOURCES ublas_interop/test1.cpp)
# bcm_test(NAME ublas_interop_test2 SOURCES ublas_interop/test2.cpp)
#run ublas_interop/test3.cpp ublas_interop/test31.cpp ublas_interop/test32.cpp ublas_interop/test33.cpp ;
# bcm_test(NAME ublas_interop_test4 SOURCES ublas_interop/test4.cpp)
# bcm_test(NAME ublas_interop_test5 SOURCES ublas_interop/test5.cpp)
# bcm_test(NAME ublas_interop_test6 SOURCES ublas_interop/test6.cpp)
#run ublas_interop/test7.cpp ublas_interop/test71.cpp ublas_interop/test72.cpp ublas_interop/test73.cpp ;

# bcm_test(NAME ublas1_et SOURCES ublas_interop/test1.cpp)
# target_compile_definitions(ublas1_et PUBLIC TEST_ET=1)
# bcm_test(NAME ublas2_et SOURCES ublas_interop/test2.cpp)
# target_compile_definitions(ublas2_et PUBLIC TEST_ET=1)
#run ublas_interop/test3.cpp ublas_interop/test31.cpp ublas_interop/test32.cpp ublas_interop/test33.cpp : : : <define>TEST_ET=1 : ublas3_et ;
# bcm_test(NAME ublas3_et SOURCES ublas_interop/test4.cpp)
# target_compile_definitions(ublas3_et PUBLIC TEST_ET=1)
# bcm_test(NAME ublas4_et SOURCES ublas_interop/test5.cpp)
# target_compile_definitions(ublas4_et PUBLIC TEST_ET=1)
# bcm_test(NAME ublas5_et SOURCES ublas_interop/test6.cpp)
# target_compile_definitions(ublas5_et PUBLIC TEST_ET=1)
#run ublas_interop/test7.cpp ublas_interop/test71.cpp ublas_interop/test72.cpp ublas_interop/test73.cpp : : : <define>TEST_ET=1 : ublas6_et ;

#
# Serialization tests, run in release mode so we cycle through more values:
#
bcm_test(NAME test_cpp_int_serial_1 SOURCES test_cpp_int_serial.cpp)
target_compile_definitions(test_cpp_int_serial_1 PUBLIC TEST1)
bcm_test(NAME test_cpp_int_serial_2 SOURCES test_cpp_int_serial.cpp)
target_compile_definitions(test_cpp_int_serial_2 PUBLIC TEST2)
bcm_test(NAME test_cpp_int_serial_3 SOURCES test_cpp_int_serial.cpp)
target_compile_definitions(test_cpp_int_serial_3 PUBLIC TEST3)
bcm_test(NAME test_cpp_int_serial_4 SOURCES test_cpp_int_serial.cpp)
target_compile_definitions(test_cpp_int_serial_4 PUBLIC TEST4)
bcm_test(NAME test_cpp_int_deserial SOURCES test_cpp_int_deserial.cpp)
bcm_test(NAME test_cpp_rat_serial SOURCES test_cpp_rat_serial.cpp)
bcm_test(NAME test_adapt_serial SOURCES test_adapt_serial.cpp)
bcm_test(NAME test_cpp_dec_float_serial_1 SOURCES test_cpp_dec_float_serial.cpp)
target_compile_definitions(test_cpp_dec_float_serial_1 PUBLIC TEST1)
bcm_test(NAME test_cpp_dec_float_serial_2 SOURCES test_cpp_dec_float_serial.cpp)
target_compile_definitions(test_cpp_dec_float_serial_2 PUBLIC TEST2)
# bcm_test(NAME test_float128_serial SOURCES test_float128_serial.cpp)
bcm_test(NAME test_bin_dec_float_serial_1 SOURCES test_cpp_bin_float_serial.cpp)
target_compile_definitions(test_bin_dec_float_serial_1 PUBLIC TEST1)
bcm_test(NAME test_bin_dec_float_serial_2 SOURCES test_cpp_bin_float_serial.cpp)
target_compile_definitions(test_bin_dec_float_serial_2 PUBLIC TEST2)

#
# Mixed mode comparison tests, see: https://svn.boost.org/trac/boost/ticket/11328
#
bcm_test(NAME test_checked_mixed_cpp_int SOURCES test_checked_mixed_cpp_int.cpp)
bcm_test(NAME test_mixed_cpp_bin_float SOURCES test_mixed_cpp_bin_float.cpp)
bcm_test(NAME test_mixed_cpp_dec_float SOURCES test_mixed_cpp_dec_float.cpp)
# bcm_test(NAME test_mixed_mpf_float SOURCES test_mixed_mpf_float.cpp)
# bcm_test(NAME test_mixed_mpfr_float SOURCES test_mixed_mpfr_float.cpp)
#
# Check for narrowing conversions:
#
bcm_test(NAME test_float_conversions SOURCES test_float_conversions.cpp)
#
# specific bug cases:
#
bcm_test(NAME bug11922 SOURCES bug11922.cpp COMPILE_ONLY)
bcm_test(NAME bug12039 SOURCES bug12039.cpp)
bcm_test(NAME test_hash SOURCES test_hash.cpp)


# bcm_test(NAME $(source:B)_mpfr SOURCES $(source))
# target_compile_definitions($(source:B)_mpfr PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
# bcm_test(NAME $(source:B)_mpf SOURCES $(source))
# target_compile_definitions($(source:B)_mpf PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
# bcm_test(NAME $(source:B)_cpp_dec_float SOURCES $(source))
# target_compile_definitions($(source:B)_cpp_dec_float PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
# bcm_test(NAME $(source:B)_cpp_bin_float SOURCES $(source))
# target_compile_definitions($(source:B)_cpp_bin_float PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
# bcm_test(NAME $(source:B)_float128 SOURCES $(source))
# target_compile_definitions($(source:B)_float128 PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
# bcm_test(NAME $(source:B)_intel_quad SOURCES $(source))
# target_compile_definitions($(source:B)_intel_quad PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)
#
# High precision tests are rather different, as they test only one
# multiprecision type and are more a test of Boost.Math:
#
# bcm_test(NAME $(source) SOURCES $(source))
# target_compile_definitions($(source) PUBLIC BOOST_OPTIONAL_USE_OLD_DEFINITION_OF_NONE)

# bcm_test(NAME $(source) SOURCES $(source) COMPILE_ONLY WILL_FAIL)



# bcm_test(NAME $(source:B)_mpfr_50 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpfr_50 PUBLIC TEST_MPFR_50)

# bcm_test(NAME $(source:B)_mpfr_6 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpfr_6 PUBLIC TEST_MPFR_6)

# bcm_test(NAME $(source:B)_mpfr_15 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpfr_15 PUBLIC TEST_MPFR_15)

# bcm_test(NAME $(source:B)_mpfr_17 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpfr_17 PUBLIC TEST_MPFR_17)

# bcm_test(NAME $(source:B)_mpfr_30 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpfr_30 PUBLIC TEST_MPFR_30)

# bcm_test(NAME $(source:B)_mpf50 SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_mpf50 PUBLIC TEST_MPF_50)

# bcm_test(NAME $(source:B)_cpp_dec_float SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_cpp_dec_float PUBLIC TEST_CPP_DEC_FLOAT)

# bcm_test(NAME $(source:B)_cpp_bin_float SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_cpp_bin_float PUBLIC TEST_CPP_BIN_FLOAT)

# bcm_test(NAME $(source:B)_cpp_dec_float_no_et SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_cpp_dec_float_no_et PUBLIC TEST_CPP_DEC_FLOAT_NO_ET)

# bcm_test(NAME $(source:B)_backend_concept SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_backend_concept PUBLIC TEST_BACKEND)

# bcm_test(NAME $(source:B)_logged_adaptor SOURCES $(source) COMPILE_ONLY)
# target_compile_definitions($(source:B)_logged_adaptor PUBLIC TEST_LOGGED_ADAPTER)







