include(BCMTest)


bcm_test_link_libraries(boost_locale
)

#
# Copyright 2011 Artyom Beilis
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt.


# Make sure we get all defines we need
# Otherwise we would have problem knowing
# what backends are actually in use

# Shared boost.locale tests

# Configuration Information
bcm_test(NAME test_config SOURCES test_config.cpp)
# Shared
bcm_test(NAME test_utf SOURCES test_utf.cpp)
bcm_test(NAME test_date_time SOURCES test_date_time.cpp)
bcm_test(NAME test_ios_prop SOURCES test_ios_prop.cpp)
bcm_test(NAME test_codecvt SOURCES test_codecvt.cpp)
bcm_test(NAME test_codepage_converter SOURCES test_codepage_converter.cpp)
bcm_test(NAME test_codepage SOURCES test_codepage.cpp)
bcm_test(NAME test_message SOURCES test_message.cpp)
bcm_test(NAME test_generator SOURCES test_generator.cpp)
# icu
bcm_test(NAME test_collate SOURCES test_collate.cpp)
bcm_test(NAME test_convert SOURCES test_convert.cpp)
bcm_test(NAME test_boundary SOURCES test_boundary.cpp)
bcm_test(NAME test_formatting SOURCES test_formatting.cpp)
bcm_test(NAME test_icu_vs_os_timezone SOURCES test_icu_vs_os_timezone.cpp)
# winapi
bcm_test(NAME test_winapi_collate SOURCES test_winapi_collate.cpp)
bcm_test(NAME test_winapi_convert SOURCES test_winapi_convert.cpp)
bcm_test(NAME test_winapi_formatting SOURCES test_winapi_formatting.cpp)
# posix
bcm_test(NAME test_posix_collate SOURCES test_posix_collate.cpp)
bcm_test(NAME test_posix_convert SOURCES test_posix_convert.cpp)
bcm_test(NAME test_posix_formatting SOURCES test_posix_formatting.cpp)
# std
bcm_test(NAME test_std_collate SOURCES test_std_collate.cpp)
bcm_test(NAME test_std_convert SOURCES test_std_convert.cpp)
bcm_test(NAME test_std_formatting SOURCES test_std_formatting.cpp)

# vim: tabstop=4 expandtab shiftwidth=4 softtabstop=4


