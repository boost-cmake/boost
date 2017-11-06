cmake_minimum_required(VERSION 3.5)
project(boost_locale)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_static_assert)
find_package(boost_thread)
find_package(boost_iterator)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_unordered)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)
find_package(ICU COMPONENTS uc dt in)
find_package(ICONV)

if(CMAKE_SYSTEM MATCHES "SunOS.*")
    set(BOOST_LOCALE_WITH_STD Off CACHE BOOL "")
else()
    set(BOOST_LOCALE_WITH_STD On CACHE BOOL "")
endif()

bcm_setup_version(VERSION 1.64.0)

add_library(boost_locale
    src/encoding/codepage.cpp
    src/shared/date_time.cpp
    src/shared/format.cpp
    src/shared/formatting.cpp
    src/shared/generator.cpp
    src/shared/ids.cpp
    src/shared/localization_backend.cpp
    src/shared/message.cpp
    src/shared/mo_lambda.cpp
    src/util/codecvt_converter.cpp
    src/util/default_locale.cpp
    src/util/info.cpp
    src/util/locale_data.cpp
)
set_property(TARGET boost_locale PROPERTY EXPORT_NAME locale)
if(BOOST_LOCALE_WITH_STD)
target_sources(boost_locale PRIVATE
    src/std/codecvt.cpp
    src/std/collate.cpp
    src/std/converter.cpp
    src/std/numeric.cpp
    src/std/std_backend.cpp
    src/util/gregorian.cpp
)
else()
target_compile_definitions(boost_locale PUBLIC BOOST_LOCALE_NO_STD_BACKEND=1)
endif()
if(ICONV_FOUND)
target_compile_definitions(boost_locale PUBLIC BOOST_LOCALE_WITH_ICONV=1)
target_link_libraries(boost_locale PUBLIC ICONV::ICONV)
endif()
if(ICU_FOUND)
target_compile_definitions(boost_locale PUBLIC BOOST_LOCALE_WITH_ICU=1)
target_link_libraries(boost_locale PUBLIC ICU::uc ICU::dt ICU::in)
target_sources(boost_locale PRIVATE
    src/icu/boundary.cpp
    src/icu/codecvt.cpp
    src/icu/collator.cpp
    src/icu/conversion.cpp
    src/icu/date_time.cpp
    src/icu/formatter.cpp
    src/icu/icu_backend.cpp
    src/icu/numeric.cpp
    src/icu/time_zone.cpp
)
endif()
if(WIN32)
target_sources(boost_locale PRIVATE
    src/win32/collate.cpp
    src/win32/converter.cpp
    src/win32/numeric.cpp
    src/win32/win_backend.cpp
)
else()
target_compile_definitions(boost_locale PUBLIC BOOST_LOCALE_NO_WINAPI_BACKEND=1)
endif()
if(UNIX)
target_sources(boost_locale PRIVATE
    src/posix/collate.cpp
    src/posix/converter.cpp
    src/posix/numeric.cpp
    src/posix/codecvt.cpp
    src/posix/posix_backend.cpp
)
else()
target_compile_definitions(boost_locale PUBLIC BOOST_LOCALE_NO_POSIX_BACKEND=1)
endif()

target_link_libraries(boost_locale PUBLIC boost::function)
target_link_libraries(boost_locale PUBLIC boost::static_assert)
target_link_libraries(boost_locale PUBLIC boost::thread)
target_link_libraries(boost_locale PUBLIC boost::iterator)
target_link_libraries(boost_locale PUBLIC boost::assert)
target_link_libraries(boost_locale PUBLIC boost::type_traits)
target_link_libraries(boost_locale PUBLIC boost::smart_ptr)
target_link_libraries(boost_locale PUBLIC boost::config)
target_link_libraries(boost_locale PUBLIC boost::unordered)




bcm_deploy(TARGETS boost_locale INCLUDE include NAMESPACE boost::)

bcm_add_test_subdirectory()
