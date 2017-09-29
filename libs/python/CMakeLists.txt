cmake_minimum_required(VERSION 3.5)
project(boost_python)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_iterator)
find_package(boost_tuple)
find_package(boost_bind)
find_package(boost_mpl)
find_package(boost_smart_ptr)
find_package(boost_detail)
find_package(boost_property_map)
find_package(boost_type_traits)
find_package(boost_graph)
find_package(boost_preprocessor)
find_package(boost_conversion)
find_package(boost_foreach)
find_package(boost_integer)
find_package(boost_lexical_cast)
find_package(boost_config)
find_package(boost_numeric_conversion)
find_package(boost_utility)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_python 
src/str.cpp
src/exec.cpp
src/object_operators.cpp
src/tuple.cpp
src/dict.cpp
src/wrapper.cpp
src/list.cpp
src/object_protocol.cpp
src/module.cpp
src/import.cpp
src/numeric.cpp
src/errors.cpp
src/long.cpp
src/slice.cpp
)
set_property(TARGET boost_python PROPERTY EXPORT_NAME python)

target_link_libraries(boost_python PUBLIC boost::function)
target_link_libraries(boost_python PUBLIC boost::core)
target_link_libraries(boost_python PUBLIC boost::static_assert)
target_link_libraries(boost_python PUBLIC boost::iterator)
target_link_libraries(boost_python PUBLIC boost::tuple)
target_link_libraries(boost_python PUBLIC boost::bind)
target_link_libraries(boost_python PUBLIC boost::mpl)
target_link_libraries(boost_python PUBLIC boost::smart_ptr)
target_link_libraries(boost_python PUBLIC boost::detail)
target_link_libraries(boost_python PUBLIC boost::property_map)
target_link_libraries(boost_python PUBLIC boost::type_traits)
target_link_libraries(boost_python PUBLIC boost::graph)
target_link_libraries(boost_python PUBLIC boost::preprocessor)
target_link_libraries(boost_python PUBLIC boost::conversion)
target_link_libraries(boost_python PUBLIC boost::foreach)
target_link_libraries(boost_python PUBLIC boost::integer)
target_link_libraries(boost_python PUBLIC boost::lexical_cast)
target_link_libraries(boost_python PUBLIC boost::config)
target_link_libraries(boost_python PUBLIC boost::numeric_conversion)
target_link_libraries(boost_python PUBLIC boost::utility)

find_package(PythonLibs)
target_link_libraries(boost_python PUBLIC ${PYTHON_LIBRARIES})
target_include_directories(boost_python PUBLIC ${PYTHON_INCLUDE_DIRS})

target_sources(boost_python PRIVATE
    src/converter/arg_to_python_base.cpp
    src/converter/builtin_converters.cpp
    src/converter/from_python.cpp
    src/converter/registry.cpp
    src/converter/type_id.cpp
    src/object/class.cpp
    src/object/enum.cpp
    src/object/function.cpp
    src/object/function_doc_signature.cpp
    src/object/inheritance.cpp
    src/object/iterator.cpp
    src/object/life_support.cpp
    src/object/pickle_support.cpp
    src/object/stl_iterator.cpp
    src/object_operators.cpp
    src/object_protocol.cpp
)

if(NOT BUILD_SHARED_LIBS)
target_compile_definitions(boost_python PUBLIC BOOST_PYTHON_STATIC_LIB)
endif()


target_include_directories(boost_python PRIVATE include)

bcm_deploy(TARGETS boost_python INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
