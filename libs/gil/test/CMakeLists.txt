include(BCMTest)

find_package(boost_crc)
find_package(boost_lambda)

bcm_test_link_libraries(boost_gil
boost::crc
boost::lambda
)

# Copyright 2008 Lubomir Bourdev and Hailin Jin
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# Cmake for building the GIL test app

bcm_test(NAME image SOURCES image.cpp sample_image.cpp error_if.cpp)
target_compile_definitions(image PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
bcm_test(NAME channel SOURCES channel.cpp error_if.cpp)
target_compile_definitions(channel PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
bcm_test(NAME pixel SOURCES pixel.cpp error_if.cpp)
target_compile_definitions(pixel PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
bcm_test(NAME pixel_iterator SOURCES pixel_iterator.cpp error_if.cpp)
target_compile_definitions(pixel_iterator PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)
bcm_test(NAME image_io SOURCES image_io.cpp error_if.cpp)
target_compile_definitions(image_io PUBLIC BOOST_GIL_NO_IO _SCL_SECURE_NO_WARNINGS)

