include(BCMTest)

find_package(boost_functional)
find_package(boost_test)
find_package(boost_lexical_cast)

bcm_test_link_libraries(boost_uuid
boost::functional
boost::test
boost::lexical_cast
)

# Copyright 2007 Andy Tompkins.
# Distributed under the Boost Software License, Version 1.0. (See
# accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)


# make sure each header file is self-contained

# test inclucing all .hpp files in 2 translations units
# to look for issues when using multiple translation units
# eg. missing inline on a global functionstate is not missing

# main test

# test uuid_io.hpp

# test generators

# test tagging an object

# test use cases

# test serializing uuids
# TODO - This test fails to like with boost_wserialization
#[ run test_wserialization.cpp
#    ../../serialization/build//boost_serialization
#    ../../serialization/build//boost_wserialization
#    : : : <dependency>../../config/test/all//BOOST_NO_STD_WSTREAMBUF
#]

# test sha1 hash function

# test MSVC 12 (VS2013) optimizer bug with SIMD operations. See https://svn.boost.org/trac/boost/ticket/8509#comment:3.
# Only happens in Release x64 builds.
bcm_test(NAME uuid_compile_uuid SOURCES compile_uuid.cpp COMPILE_ONLY)
bcm_test(NAME uuid_compile_uuid_no_type_traits SOURCES compile_uuid.cpp COMPILE_ONLY)
target_compile_definitions(uuid_compile_uuid_no_type_traits PUBLIC BOOST_UUID_NO_TYPE_TRAITS)
bcm_test(NAME uuid_compile_uuid_io SOURCES compile_uuid_io.cpp COMPILE_ONLY)
bcm_test(NAME uuid_compile_uuid_serialize SOURCES compile_uuid_serialize.cpp COMPILE_ONLY)
bcm_test(NAME uuid_compile_uuid_generators SOURCES compile_uuid_generators.cpp COMPILE_ONLY)
bcm_test(NAME uuid_compile_nil_generator SOURCES compile_nil_generator.cpp COMPILE_ONLY)
bcm_test(NAME uuid_compile_name_generator SOURCES compile_name_generator.cpp COMPILE_ONLY)
bcm_test(NAME uuid_compile_string_generator SOURCES compile_string_generator.cpp COMPILE_ONLY)
bcm_test(NAME uuid_compile_random_generator SOURCES compile_random_generator.cpp COMPILE_ONLY)
bcm_test(NAME uuid_compile_seed_rng SOURCES compile_seed_rng.cpp COMPILE_ONLY)
bcm_test(NAME uuid_test_include1 SOURCES test_include1.cpp)
bcm_test(NAME uuid_test_uuid SOURCES test_uuid.cpp)
bcm_test(NAME uuid_test_uuid_no_simd SOURCES test_uuid_no_simd.cpp)
bcm_test(NAME uuid_test_io SOURCES test_io.cpp)
bcm_test(NAME uuid_test_nil_generator SOURCES test_nil_generator.cpp)
bcm_test(NAME uuid_test_name_generator SOURCES test_name_generator.cpp)
bcm_test(NAME uuid_test_string_generator SOURCES test_string_generator.cpp)
bcm_test(NAME uuid_test_random_generator SOURCES test_random_generator.cpp)
bcm_test(NAME uuid_test_tagging SOURCES test_tagging.cpp)
bcm_test(NAME uuid_test_uuid_class SOURCES test_uuid_class.cpp)
bcm_test(NAME uuid_test_uuid_in_map SOURCES test_uuid_in_map.cpp)
bcm_test(NAME uuid_test_serialization SOURCES test_serialization.cpp)
bcm_test(NAME uuid_test_sha1 SOURCES test_sha1.cpp)
# bcm_test(NAME uuid_test_msvc_simd_bug981648 SOURCES test_msvc_simd_bug981648_main.cpp)

