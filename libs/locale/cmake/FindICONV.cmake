include(CheckFunctionExists)

find_path(ICONV_INCLUDE_DIR iconv.h)

set(ICONV_NAMES iconv libiconv libiconv2 libiconv-2)

find_library(ICONV_LIBRARY NAMES ${ICONV_NAMES} PATHS ${ICONV_INCLUDE_DIR}/../bin)

check_function_exists(iconv HAVE_ICONV_IN_LIBC)
if(ICONV_INCLUDE_DIR AND HAVE_ICONV_IN_LIBC)
    set(ICONV_FOUND TRUE)
    set(ICONV_LIBRARY "" CACHE TYPE STRING FORCE)
elseif(ICONV_INCLUDE_DIR AND ICONV_LIBRARY)
    set(ICONV_FOUND TRUE)
endif()

if(ICONV_FOUND)
  if(HAVE_ICONV_IN_LIBC)
    add_library(ICONV::ICONV INTERFACE IMPORTED)
  else()
    add_library(ICONV::ICONV UNKNOWN IMPORTED)
    set_target_properties(ICONV::ICONV PROPERTIES
      IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
      IMPORTED_LOCATION "${ICONV_LIBRARY}")
  endif()
  set_target_properties(ICONV::ICONV PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${ICONV_INCLUDE_DIR}")
  if(NOT ICONV_FIND_QUIETLY)
    message(STATUS "Found iconv library: ${ICONV_LIBRARY}")
  endif()
else()
   if(ICONV_FIND_REQUIRED)
      message(STATUS "Looked for iconv library named ${ICONV_NAMES}.")
      message(STATUS "Found no acceptable iconv library. This is fatal.")
      message(STATUS "iconv header: ${ICONV_INCLUDE_DIR}")
      message(STATUS "iconv lib   : ${ICONV_LIBRARY}")
      message(FATAL_ERROR "Could NOT find iconv library")
   endif()
endif()

mark_as_advanced(ICONV_LIBRARY ICONV_INCLUDE_DIR)
