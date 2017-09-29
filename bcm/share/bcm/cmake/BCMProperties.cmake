# Custom properties from Niall Douglas

# On MSVC very annoyingly cmake puts /EHsc and /MD(d) into the global flags which means you
# get a warning when you try to disable exceptions or use the static CRT. I hate to use this
# globally imposed solution, but we are going to hack the global flags to use properties to
# determine whether they are on or off
# 
# Create custom properties called CXX_EXCEPTIONS, CXX_RTTI and CXX_STATIC_RUNTIME
# These get placed at global, directory and target scopes
foreach(scope GLOBAL DIRECTORY TARGET)
  define_property(${scope} PROPERTY "CXX_EXCEPTIONS" INHERITED
    BRIEF_DOCS "Enable C++ exceptions, defaults to ON at global scope"
    FULL_DOCS "Enable C++ exceptions, defaults to ON at global scope"
  )
  define_property(${scope} PROPERTY "CXX_RTTI" INHERITED
    BRIEF_DOCS "Enable C++ runtime type information, defaults to ON at global scope"
    FULL_DOCS "Enable C++ runtime type information, defaults to ON at global scope"
  )
  define_property(${scope} PROPERTY "CXX_STATIC_RUNTIME" INHERITED
    BRIEF_DOCS "Enable linking against the static C++ runtime, defaults to OFF at global scope"
    FULL_DOCS "Enable linking against the static C++ runtime, defaults to OFF at global scope"
  )
  define_property(${scope} PROPERTY "CXX_WARNINGS" INHERITED
    BRIEF_DOCS "Controls the warning level of compilers, defaults to ON at global scope"
    FULL_DOCS "Controls the warning level of compilers, defaults to ON at global scope"
  )
  define_property(${scope} PROPERTY "CXX_WARNINGS_AS_ERRORS" INHERITED
    BRIEF_DOCS "Treat warnings as errors and abort compilation on a warning, defaults to OFF at global scope"
    FULL_DOCS "Treat warnings as errors and abort compilation on a warning, defaults to OFF at global scope"
  )
endforeach()
# Set the default for these properties at global scope. If they are not set per target or
# whatever, the next highest scope will be looked up
set_property(GLOBAL PROPERTY CXX_EXCEPTIONS ON)
set_property(GLOBAL PROPERTY CXX_RTTI ON)
set_property(GLOBAL PROPERTY CXX_STATIC_RUNTIME OFF)
set_property(GLOBAL PROPERTY CXX_WARNINGS ON)
set_property(GLOBAL PROPERTY CXX_WARNINGS_AS_ERRORS OFF)
if(MSVC)
  # Purge unconditional use of /MDd, /MD and /EHsc.
  foreach(flag
          CMAKE_C_FLAGS                CMAKE_CXX_FLAGS
          CMAKE_C_FLAGS_DEBUG          CMAKE_CXX_FLAGS_DEBUG
          CMAKE_C_FLAGS_RELEASE        CMAKE_CXX_FLAGS_RELEASE
          CMAKE_C_FLAGS_MINSIZEREL     CMAKE_CXX_FLAGS_MINSIZEREL
          CMAKE_C_FLAGS_RELWITHDEBINFO CMAKE_CXX_FLAGS_RELWITHDEBINFO
          )
    string(REPLACE "/MDd"  "" ${flag} "${${flag}}")
    string(REPLACE "/MD"   "" ${flag} "${${flag}}")
    string(REPLACE "/EHsc" "" ${flag} "${${flag}}")
    string(REPLACE "/GR" "" ${flag} "${${flag}}")
  endforeach()
  # Restore those same, but now selected by the properties
  add_compile_options(
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_EXCEPTIONS>>,ON>:/EHsc>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_RTTI>>,OFF>:/GR->
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_STATIC_RUNTIME>>,OFF>:$<$<CONFIG:Debug>:/MDd>$<$<NOT:$<CONFIG:Debug>>:/MD>>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_STATIC_RUNTIME>>,ON>:$<$<CONFIG:Debug>:/MTd>$<$<NOT:$<CONFIG:Debug>>:/MT>>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS>>,ON>:/W3>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS>>,OFF>:/W0>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS>>,ALL>:/W4>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS_AS_ERRORS>>,ON>:/WX>
  )
else()
  add_compile_options(
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_EXCEPTIONS>>,OFF>:-fno-exceptions>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_RTTI>>,OFF>:-fno-rtti>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_STATIC_RUNTIME>>,ON>:-static>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS>>,ON>:-Wall>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS>>,OFF>:-w>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS>>,ALL>:-Wall>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS>>,ALL>:-pedantic>
    $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS_AS_ERRORS>>,ON>:-Werror>
  )
  if (CMAKE_${COMPILER}_COMPILER_ID MATCHES "Clang")
    add_compile_options(
      $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS>>,ALL>:-Weverything>
      $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS>>,ALL>:-Wno-c++98-compat>
      $<$<STREQUAL:$<UPPER_CASE:$<TARGET_PROPERTY:CXX_WARNINGS>>,ALL>:-Wno-c++98-compat-pedantic>
    )
  endif()
endif()

