
cmake_minimum_required(VERSION 3.5)
project(boost)

macro(find_package NAME)
    if(NOT "${NAME}" MATCHES "^boost_.*$" AND NOT "${NAME}" STREQUAL BCM)
        _find_package(${ARGV})
    else()
        set(${ARGV0}_FOUND ON CACHE BOOL "")
    endif()
endmacro()

include(bcm/share/bcm/cmake/BCMConfig.cmake)

set(EXCLUDE_LIBS)

find_package(PythonLibs)
if(NOT PythonLibs_FOUND)
    list(APPEND EXCLUDE_LIBS python)
endif()

find_package(PythonLibs)
if(NOT PythonLibs_FOUND)
    list(APPEND EXCLUDE_LIBS python)
endif()

find_package(MPI)
if(NOT MPI_FOUND)
    list(APPEND EXCLUDE_LIBS mpi)
endif()

file(GLOB_RECURSE LIBS libs/*CMakeLists.txt)
foreach(lib ${LIBS})
    file(READ ${lib} CONTENT)
    if("${CONTENT}" MATCHES "project\\(")
        get_filename_component(LIB_DIR ${lib} DIRECTORY)
        get_filename_component(LIB_NAME ${LIB_DIR} NAME)
        if(NOT "${LIB_NAME}" IN_LIST EXCLUDE_LIBS)
            add_subdirectory(${LIB_DIR})
        endif()
    endif()
endforeach()
