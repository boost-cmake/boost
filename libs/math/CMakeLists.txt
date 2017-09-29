cmake_minimum_required(VERSION 3.5)
project(boost_math)

find_package(BCM)
include(BCMDeploy)
include(BCMSetupVersion)
include(CheckTypeSize)

find_package(boost_function)
find_package(boost_core)
find_package(boost_static_assert)
find_package(boost_predef)
find_package(boost_tuple)
find_package(boost_array)
find_package(boost_mpl)
find_package(boost_atomic)
find_package(boost_detail)
find_package(boost_fusion)
find_package(boost_assert)
find_package(boost_range)
find_package(boost_type_traits)
find_package(boost_concept_check)
find_package(boost_smart_ptr)
find_package(boost_lexical_cast)
find_package(boost_utility)
find_package(boost_config)
find_package(boost_throw_exception)
find_package(boost_lambda)

bcm_setup_version(VERSION 1.64.0)

add_library(boost_math INTERFACE)

set_property(TARGET boost_math PROPERTY EXPORT_NAME math)

target_link_libraries(boost_math INTERFACE boost::function)
target_link_libraries(boost_math INTERFACE boost::core)
target_link_libraries(boost_math INTERFACE boost::static_assert)
target_link_libraries(boost_math INTERFACE boost::predef)
target_link_libraries(boost_math INTERFACE boost::tuple)
target_link_libraries(boost_math INTERFACE boost::array)
target_link_libraries(boost_math INTERFACE boost::mpl)
target_link_libraries(boost_math INTERFACE boost::atomic)
target_link_libraries(boost_math INTERFACE boost::detail)
target_link_libraries(boost_math INTERFACE boost::fusion)
target_link_libraries(boost_math INTERFACE boost::assert)
target_link_libraries(boost_math INTERFACE boost::range)
target_link_libraries(boost_math INTERFACE boost::type_traits)
target_link_libraries(boost_math INTERFACE boost::concept_check)
target_link_libraries(boost_math INTERFACE boost::smart_ptr)
target_link_libraries(boost_math INTERFACE boost::lexical_cast)
target_link_libraries(boost_math INTERFACE boost::utility)
target_link_libraries(boost_math INTERFACE boost::config)
target_link_libraries(boost_math INTERFACE boost::throw_exception)
target_link_libraries(boost_math INTERFACE boost::lambda)

set(BOOST_MATH_c99_SOURCES 
src/tr1/acosh
src/tr1/asinh
src/tr1/atanh
src/tr1/cbrt
src/tr1/copysign
src/tr1/erfc
src/tr1/erf
src/tr1/expm1
src/tr1/fmax
src/tr1/fmin
src/tr1/fpclassify
src/tr1/hypot
src/tr1/lgamma
src/tr1/llround
src/tr1/log1p
src/tr1/lround
src/tr1/nextafter
src/tr1/nexttoward
src/tr1/round
src/tr1/tgamma
src/tr1/trunc
)

set(BOOST_MATH_tr1_SOURCES 
src/tr1/assoc_laguerre
src/tr1/assoc_legendre
src/tr1/beta
src/tr1/comp_ellint_1
src/tr1/comp_ellint_2
src/tr1/comp_ellint_3
src/tr1/cyl_bessel_i
src/tr1/cyl_bessel_j
src/tr1/cyl_bessel_k
src/tr1/cyl_neumann
src/tr1/ellint_1
src/tr1/ellint_2
src/tr1/ellint_3
src/tr1/expint
src/tr1/hermite
src/tr1/laguerre
src/tr1/legendre
src/tr1/riemann_zeta
src/tr1/sph_bessel
src/tr1/sph_legendre
src/tr1/sph_neumann
)

function(add_boost_math_library NAME)
    set(SOURCES)
    foreach(SOURCE ${BOOST_MATH_${NAME}_SOURCES})
        list(APPEND SOURCES ${SOURCE}${ARGN}.cpp)
    endforeach()
    add_library(boost_math_${NAME}${ARGN} ${SOURCES})
    set_property(TARGET boost_math_${NAME}${ARGN} PROPERTY EXPORT_NAME math_${NAME}${ARGN})
    target_include_directories(boost_math_${NAME}${ARGN} PRIVATE src/tr1)
    target_link_libraries(boost_math_${NAME}${ARGN} boost_math)
endfunction()

check_type_size("long double" SIZEOF_LONG_DOUBLE)

add_boost_math_library(tr1)
add_boost_math_library(tr1 f)
if(HAVE_SIZEOF_LONG_DOUBLE)
    add_boost_math_library(tr1 l)
endif()

add_boost_math_library(c99)
add_boost_math_library(c99 f)
if(HAVE_SIZEOF_LONG_DOUBLE)
    add_boost_math_library(c99 l)
endif()

bcm_deploy(TARGETS boost_math boost_math_c99 boost_math_c99f boost_math_c99l boost_math_tr1 boost_math_tr1f boost_math_tr1l INCLUDE include NAMESPACE boost::)

add_subdirectory(test)
