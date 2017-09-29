include(BCMTest)


bcm_test_link_libraries(boost_predef
)

include(BCMProperties)

bcm_test(NAME info_as_cpp SOURCES info_as_cpp.cpp)
bcm_test(NAME info_as_c SOURCES info_as_c.c)
if(APPLE)
    bcm_test(NAME info_as_objcpp SOURCES info_as_objcpp.mm)
    set_source_files_properties(info_as_objcpp.mm PROPERTIES COMPILE_FLAGS "-x objective-c++")
    bcm_test(NAME info_as_objc SOURCES info_as_objc.m)
    set_source_files_properties(info_as_objc.m PROPERTIES COMPILE_FLAGS "-x objective-c")
endif()
bcm_test(NAME version SOURCES version.cpp)
bcm_test(NAME make SOURCES make.cpp)
if(APPLE)
    bcm_test(NAME macos_endian SOURCES macos_endian.c COMPILE_ONLY)
    bcm_test(NAME macos_vs_bsd SOURCES macos_vs_bsd.c COMPILE_ONLY)
endif()
if(NOT CMAKE_SYSTEM_NAME MATCHES "Linux")
    if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        bcm_test(NAME check_value SOURCES check_value.cpp)
    endif()
endif()

