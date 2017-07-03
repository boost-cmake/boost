
cmake_minimum_required(VERSION 3.5)
project(boost_context)
include(CMakePackageConfigHelpers)

find_package(boost_thread)
find_package(boost_assert)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_pool)

add_library(boost_context 
src/execution_context.cpp
src/dummy.cpp
)
add_library(boost::context ALIAS boost_context)
set_property(TARGET boost_context PROPERTY EXPORT_NAME context)

target_include_directories(boost_context PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_thread_FOUND)
target_link_libraries(boost_context PUBLIC boost::thread)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_context PUBLIC boost::assert)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_context PUBLIC boost::smart_ptr)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_context PUBLIC boost::config)
endif()
if(boost_pool_FOUND)
target_link_libraries(boost_context PUBLIC boost::pool)
endif()

set(abi
  aapcs
  eabi
  ms
  n32
  n64
  o32
  o64
  sysv
)

set(binary_format
  elf
  mach-o
  pe
)

set(arch
  arm
  arm64
  mips32
  ppc32
  ppc64
  i386
  x86_64
)

if(WIN32)
  set(default_abi ms)
elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "arm")
  set(default_abi aapcs)
elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "mips")
  set(default_abi o32)
else()
  set(default_abi sysv)
endif()
  
if(APPLE)
  set(default_binary_format mach-o)
elseif(WIN32)
  set(default_binary_format pe)
else()
  set(default_binary_format elf)
endif()

if("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "arm")
  if(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set(default_arch arm)
  else()
    set(default_arch arm64)
  endif()
elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "mips")
  set(default_arch mips32)
else()
  if(CMAKE_SIZEOF_VOID_P EQUAL 4)
    set(default_arch i386)
  else()
    set(default_arch x86_64)
  endif()
endif()

set(BOOST_CONTEXT_ABI ${default_abi}
  CACHE STRING "ABI for Boost.Context (${abi})"
  )
set_property(CACHE BOOST_CONTEXT_ABI
  PROPERTY STRINGS "${abi}"
  )

set(BOOST_CONTEXT_BINARY_FORMAT ${default_binary_format}
  CACHE STRING "Binary format for Boost.Context (${binary_format})"
  )
set_property(CACHE BOOST_CONTEXT_BINARY_FORMAT
  PROPERTY STRINGS "${binary_format}"
  )


set(BOOST_CONTEXT_ARCHITECTURE ${default_arch}
  CACHE STRING "Architecture for Boost.Context (${arch})"
  )
set_property(CACHE BOOST_CONTEXT_ARCHITECTURE
  PROPERTY STRINGS "${arch}"
  )

if(MSVC)
set(asm_format "masm.asm")
else()
set(asm_format "gas.S")
endif()

target_sources(boost_context PRIVATE 
  src/asm/make_${BOOST_CONTEXT_ARCHITECTURE}_${BOOST_CONTEXT_ABI}_${BOOST_CONTEXT_BINARY_FORMAT}_${asm_format}
  src/asm/jump_${BOOST_CONTEXT_ARCHITECTURE}_${BOOST_CONTEXT_ABI}_${BOOST_CONTEXT_BINARY_FORMAT}_${asm_format}
  src/asm/ontop_${BOOST_CONTEXT_ARCHITECTURE}_${BOOST_CONTEXT_ABI}_${BOOST_CONTEXT_BINARY_FORMAT}_${asm_format}
)

find_path(UCONTEXT_INCLUDE_DIR ucontext.h)

if(UCONTEXT_INCLUDE_DIR AND UCONTEXT_INCLUDE_DIR)
target_include_directories(boost_context PRIVATE ${UCONTEXT_INCLUDE_DIR})
target_compile_definitions(boost_context PRIVATE -DBOOST_USE_UCONTEXT=1)
endif()


install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_context EXPORT boost_context-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_context-targets
  FILE boost_context-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_context
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_context-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_thread_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_context-config.cmake" "
find_package(boost_thread)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_context-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_context-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_context-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_pool_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_context-config.cmake" "
find_package(boost_pool)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_context-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_context-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_context-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_context-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_context-config-version.cmake"
  DESTINATION lib/cmake/boost_context
)

