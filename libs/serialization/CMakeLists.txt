
cmake_minimum_required(VERSION 3.5)
project(boost_serialization)
include(CMakePackageConfigHelpers)

find_package(boost_predef)
find_package(boost_move)
find_package(boost_io)
find_package(boost_array)
find_package(boost_unordered)
find_package(boost_utility)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_detail)
find_package(boost_type_traits)
find_package(boost_smart_ptr)
find_package(boost_config)
find_package(boost_function)
find_package(boost_core)
find_package(boost_mpl)
find_package(boost_variant)
find_package(boost_assert)
find_package(boost_preprocessor)
find_package(boost_integer)
find_package(boost_optional)
find_package(boost_spirit)

add_library(boost_serialization 
src/extended_type_info_no_rtti.cpp
src/basic_text_woprimitive.cpp
src/codecvt_null.cpp
src/basic_iarchive.cpp
src/extended_type_info_typeid.cpp
src/xml_woarchive.cpp
src/xml_archive_exception.cpp
src/singleton.cpp
src/basic_xml_archive.cpp
src/binary_oarchive.cpp
src/text_woarchive.cpp
src/binary_woarchive.cpp
src/polymorphic_oarchive.cpp
src/text_wiarchive.cpp
src/text_iarchive.cpp
src/basic_pointer_iserializer.cpp
src/void_cast.cpp
src/utf8_codecvt_facet.cpp
src/basic_pointer_oserializer.cpp
src/basic_text_oprimitive.cpp
src/basic_serializer_map.cpp
src/binary_iarchive.cpp
src/binary_wiarchive.cpp
src/extended_type_info.cpp
src/basic_text_wiprimitive.cpp
src/basic_iserializer.cpp
src/basic_text_iprimitive.cpp
src/text_oarchive.cpp
src/xml_iarchive.cpp
src/xml_oarchive.cpp
src/xml_wiarchive.cpp
src/xml_wgrammar.cpp
src/basic_oserializer.cpp
src/basic_oarchive.cpp
src/basic_archive.cpp
src/archive_exception.cpp
src/polymorphic_iarchive.cpp
src/stl_port.cpp
src/xml_grammar.cpp
)
add_library(boost::serialization ALIAS boost_serialization)
set_property(TARGET boost_serialization PROPERTY EXPORT_NAME serialization)

target_include_directories(boost_serialization PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)

if(boost_predef_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::predef)
endif()
if(boost_move_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::move)
endif()
if(boost_io_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::io)
endif()
if(boost_array_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::array)
endif()
if(boost_unordered_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::unordered)
endif()
if(boost_utility_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::utility)
endif()
if(boost_static_assert_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::static_assert)
endif()
if(boost_iterator_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::iterator)
endif()
if(boost_detail_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::detail)
endif()
if(boost_type_traits_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::type_traits)
endif()
if(boost_smart_ptr_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::smart_ptr)
endif()
if(boost_config_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::config)
endif()
if(boost_function_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::function)
endif()
if(boost_core_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::core)
endif()
if(boost_mpl_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::mpl)
endif()
if(boost_variant_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::variant)
endif()
if(boost_assert_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::assert)
endif()
if(boost_preprocessor_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::preprocessor)
endif()
if(boost_integer_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::integer)
endif()
if(boost_optional_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::optional)
endif()
if(boost_spirit_FOUND)
target_link_libraries(boost_serialization PUBLIC boost::spirit)
endif()



install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_serialization EXPORT boost_serialization-targets
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    INCLUDES DESTINATION include
)

install(EXPORT boost_serialization-targets
  FILE boost_serialization-targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/boost_serialization
)

file(WRITE "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "include(CMakeFindDependencyMacro)")
if(boost_predef_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_predef)
")
endif()
if(boost_move_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_move)
")
endif()
if(boost_io_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_io)
")
endif()
if(boost_array_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_array)
")
endif()
if(boost_unordered_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_unordered)
")
endif()
if(boost_utility_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_utility)
")
endif()
if(boost_static_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_static_assert)
")
endif()
if(boost_iterator_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_iterator)
")
endif()
if(boost_detail_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_detail)
")
endif()
if(boost_type_traits_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_type_traits)
")
endif()
if(boost_smart_ptr_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_smart_ptr)
")
endif()
if(boost_config_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_config)
")
endif()
if(boost_function_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_function)
")
endif()
if(boost_core_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_core)
")
endif()
if(boost_mpl_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_mpl)
")
endif()
if(boost_variant_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_variant)
")
endif()
if(boost_assert_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_assert)
")
endif()
if(boost_preprocessor_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_preprocessor)
")
endif()
if(boost_integer_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_integer)
")
endif()
if(boost_optional_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_optional)
")
endif()
if(boost_spirit_FOUND)
file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
find_package(boost_spirit)
")
endif()


file(APPEND "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake" "
include(\"\${CMAKE_CURRENT_LIST_DIR}/boost_serialization-targets.cmake\")
")

write_basic_package_version_file("${PROJECT_BINARY_DIR}/boost_serialization-config-version.cmake"
  VERSION 1.64
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${PROJECT_BINARY_DIR}/boost_serialization-config.cmake"
    "${PROJECT_BINARY_DIR}/boost_serialization-config-version.cmake"
  DESTINATION lib/cmake/boost_serialization
)

