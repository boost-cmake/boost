
cmake_minimum_required(VERSION 3.5)
project(boost_numeric_odeint)
include(CMakePackageConfigHelpers)

find_package(boost_numeric_ublas)
find_package(boost_iterator)
find_package(boost_array)
find_package(boost_utility)
find_package(boost_static_assert)
find_package(boost_type_traits)
find_package(boost_units)
find_package(boost_config)
find_package(boost_math)
find_package(boost_function)
find_package(boost_core)
find_package(boost_mpl)
find_package(boost_mpi)
find_package(boost_assert)
find_package(boost_fusion)
find_package(boost_preprocessor)
find_package(boost_compute)
find_package(boost_multi_array)
find_package(boost_bind)
find_package(boost_range)
find_package(boost_throw_exception)

add_library(boost_numeric_odeint INTERFACE
)
add_library(boost::numeric_odeint ALIAS boost_numeric_odeint)
set_property(TARGET boost_numeric_odeint PROPERTY EXPORT_NAME numeric_odeint)

target_include_directories(boost_numeric_odeint INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_numeric_ublas_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::numeric_ublas)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::iterator)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::array)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::utility)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::static_assert)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::type_traits)
endif()
if(boost_units_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::units)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::config)
endif()
if(boost_math_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::math)
endif()
if(boost_function_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::core)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::mpl)
endif()
if(boost_mpi_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::mpi)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::assert)
endif()
if(boost_fusion_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::fusion)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::preprocessor)
endif()
if(boost_compute_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::compute)
endif()
if(boost_multi_array_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::multi_array)
endif()
if(boost_bind_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::bind)
endif()
if(boost_range_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::range)
endif()
if(boost_throw_exception_FOUND)
target_link_libraries(boost_numeric_odeint INTERFACE boost::throw_exception)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_numeric_odeint EXPORT boost_numeric_odeint-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_numeric_odeint-targets
  FILE boost_numeric_odeint-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_numeric_odeint
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_numeric_ublas_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_numeric_ublas)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_units_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_units)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_math_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_math)
")
endif()
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_mpi_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_mpi)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_fusion_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_fusion)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_compute_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_compute)
")
endif()
if(boost_multi_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_multi_array)
")
endif()
if(boost_bind_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_bind)
")
endif()
if(boost_range_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_range)
")
endif()
if(boost_throw_exception_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
find_package(boost_throw_exception)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_numeric_odeint-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_numeric_odeint-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_numeric_odeint-config-version.cmake"
  DESTINATION lib/cmake/boost_numeric_odeint
)

