cmake_minimum_required (VERSION 3.5)
project(superproject)

macro(find_package NAME)
    if(NOT "${NAME}" STREQUAL "simple")
        _find_package(${ARGV})
    endif()
endmacro()

add_subdirectory(../libsimplenamespace libsimplenamespace)
add_subdirectory(../libbasicnamespace libbasicnamespace)
