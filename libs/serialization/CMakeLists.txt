cmake_minimum_required(VERSION 3.5)
project(boost_serialization)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

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

bcm_setup_version(VERSION 1.64.0)

add_library(boost_serialization 
src/basic_archive.cpp
src/xml_grammar.cpp
src/xml_wiarchive.cpp
src/basic_oarchive.cpp
src/singleton.cpp
src/basic_oserializer.cpp
src/polymorphic_oarchive.cpp
src/text_woarchive.cpp
src/extended_type_info.cpp
src/xml_wgrammar.cpp
src/binary_wiarchive.cpp
src/basic_pointer_iserializer.cpp
src/basic_iarchive.cpp
src/basic_xml_archive.cpp
src/stl_port.cpp
src/codecvt_null.cpp
src/extended_type_info_typeid.cpp
src/binary_woarchive.cpp
src/basic_pointer_oserializer.cpp
src/basic_serializer_map.cpp
src/text_wiarchive.cpp
src/xml_iarchive.cpp
src/basic_text_woprimitive.cpp
src/basic_iserializer.cpp
src/binary_oarchive.cpp
src/basic_text_iprimitive.cpp
src/xml_oarchive.cpp
src/xml_archive_exception.cpp
src/void_cast.cpp
src/xml_woarchive.cpp
src/binary_iarchive.cpp
src/basic_text_wiprimitive.cpp
src/archive_exception.cpp
src/extended_type_info_no_rtti.cpp
src/polymorphic_iarchive.cpp
src/text_iarchive.cpp
src/utf8_codecvt_facet.cpp
src/text_oarchive.cpp
src/basic_text_oprimitive.cpp
)
set_property(TARGET boost_serialization PROPERTY EXPORT_NAME serialization)

target_link_libraries(boost_serialization PUBLIC boost::predef)
target_link_libraries(boost_serialization PUBLIC boost::move)
target_link_libraries(boost_serialization PUBLIC boost::io)
target_link_libraries(boost_serialization PUBLIC boost::array)
target_link_libraries(boost_serialization PUBLIC boost::unordered)
target_link_libraries(boost_serialization PUBLIC boost::utility)
target_link_libraries(boost_serialization PUBLIC boost::static_assert)
target_link_libraries(boost_serialization PUBLIC boost::iterator)
target_link_libraries(boost_serialization PUBLIC boost::detail)
target_link_libraries(boost_serialization PUBLIC boost::type_traits)
target_link_libraries(boost_serialization PUBLIC boost::smart_ptr)
target_link_libraries(boost_serialization PUBLIC boost::config)
target_link_libraries(boost_serialization PUBLIC boost::function)
target_link_libraries(boost_serialization PUBLIC boost::core)
target_link_libraries(boost_serialization PUBLIC boost::mpl)
target_link_libraries(boost_serialization PUBLIC boost::variant)
target_link_libraries(boost_serialization PUBLIC boost::assert)
target_link_libraries(boost_serialization PUBLIC boost::preprocessor)
target_link_libraries(boost_serialization PUBLIC boost::integer)
target_link_libraries(boost_serialization PUBLIC boost::optional)
target_link_libraries(boost_serialization PUBLIC boost::spirit)



target_include_directories(boost_serialization PRIVATE include)

bcm_deploy(TARGETS boost_serialization INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
