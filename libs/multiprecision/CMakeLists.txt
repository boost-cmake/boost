
cmake_minimum_required(VERSION 3.5)
project(boost_multiprecision)
include(CMakePackageConfigHelpers)

find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_mpl)
find_package(boost_random)
find_package(boost_functional)
find_package(boost_assert)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_rational)
find_package(boost_lexical_cast)
find_package(boost_integer)
find_package(boost_array)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_math)

add_library(boost_multiprecision INTERFACE
)
add_library(boost::multiprecision ALIAS boost_multiprecision)
set_property(TARGET boost_multiprecision PROPERTY EXPORT_NAME multiprecision)

target_include_directories(boost_multiprecision INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_core_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::core)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::static_assert)
endif()
if(boost_predef_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::predef)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::mpl)
endif()
if(boost_random_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::random)
endif()
if(boost_functional_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::functional)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::smart_ptr)
endif()
if(boost_rational_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::rational)
endif()
if(boost_lexical_cast_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::lexical_cast)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::integer)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::array)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::config)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::throw_exception)
endif()
if(boost_math_FOUND)
target_link_libraries(boost_multiprecision INTERFACE boost::math)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_multiprecision EXPORT boost_multiprecision-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_multiprecision-targets
  FILE boost_multiprecision-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_multiprecision
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_random_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_random)
")
endif()
if(boost_functional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_functional)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_rational_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_rational)
")
endif()
if(boost_lexical_cast_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_lexical_cast)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_throw_exception)
")
endif()
if(boost_math_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
find_package(boost_math)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_multiprecision-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_multiprecision-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_multiprecision-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_multiprecision-config-version.cmake"
  DESTINATION lib/cmake/boost_multiprecision
)

