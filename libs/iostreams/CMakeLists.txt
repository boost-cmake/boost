
cmake_minimum_required(VERSION 3.5)
project(boost_iostreams)
include(CMakePackageConfigHelpers)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_random)
find_package(boost_detail)
find_package(boost_regex)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_preprocessor)
find_package(boost_smart_ptr)
find_package(boost_integer)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_utility)
find_package(ZLIB)
find_package(BZip2)

add_library(boost_iostreams 
src/mapped_file.cpp
src/file_descriptor.cpp
src/gzip.cpp
)
add_library(boost::iostreams ALIAS boost_iostreams)
set_property(TARGET boost_iostreams PROPERTY EXPORT_NAME iostreams)

target_include_directories(boost_iostreams PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_function_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::static_assert)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::bind)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::mpl)
endif()
if(boost_random_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::random)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::detail)
endif()
if(boost_regex_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::regex)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::assert)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::range)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::type_traits)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::preprocessor)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::smart_ptr)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::integer)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::throw_exception)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_iostreams PUBLIC boost::utility)
endif()
if(ZLIB_FOUND)
target_link_libraries(boost_iostreams PUBLIC ZLIB::ZLIB)
endif()
if(BZip2_FOUND)
target_link_libraries(boost_iostreams PUBLIC BZip2::BZip2)
endif()

if(ZLIB_FOUND)
target_sources(boost_iostreams PRIVATE src/zlib.cpp)
endif()

if(BZip2_FOUND)
target_sources(boost_iostreams PRIVATE src/bzip2.cpp)
endif()


install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_iostreams EXPORT boost_iostreams-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_iostreams-targets
  FILE boost_iostreams-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_iostreams
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_random_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_random)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_regex_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_regex)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(boost_utility)
")
endif()
if(ZLIB_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(ZLIB)
")
endif()
if(BZip2_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
find_package(BZip2)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_iostreams-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_iostreams-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_iostreams-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_iostreams-config-version.cmake"
  DESTINATION lib/cmake/boost_iostreams
)

