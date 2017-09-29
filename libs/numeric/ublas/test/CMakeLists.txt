include(BCMTest)

find_package(boost_detail)
find_package(boost_timer)
find_package(boost_numeric_interval)
find_package(boost_test)
find_package(boost_math)

bcm_test_link_libraries(boost_numeric_ublas
boost::detail
boost::timer
boost::numeric_interval
boost::test
boost::math
)

# Copyright (c) 2004-2011 Michael Stevens, David Bellot
# Use, modification and distribution are subject to the
# Boost Software License, Version 1.0. (See accompanying file
# LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

# Bring in rules for testing

# Define features to test:
#  Value types: USE_FLOAT USE_DOUBLE USE_STD_COMPLEX
#  Proxies: USE_RANGE USE_SLICE
#  Storage types: USE_BOUNDED_ARRAY USE_UNBOUNDED_ARRAY
#  Vector types: USE_STD_VECTOR USE_BOUNDED_VECTOR
#  Matrix types: USE_MATRIX USE_BOUNDED_MATRIX USE_VECTOR_OF_VECTOR
#  Adaptors: USE_ADAPTOR

set(UBLAS_TESTSET "USE_DOUBLE;USE_STD_COMPLEX;USE_RANGE;USE_SLICE;USE_UNBOUNDED_ARRAY;USE_STD_VECTOR;USE_BOUNDED_VECTOR;USE_MATRIX" CACHE STRING "")
set(UBLAS_TESTSET_SPARSE "USE_DOUBLE;USE_STD_COMPLEX;USE_UNBOUNDED_ARRAY;USE_MAP_ARRAY;USE_STD_MAP;USE_MAPPED_VECTOR;USE_COMPRESSED_VECTOR;USE_MAPPED_MATRIX;USE_COMPRESSED_MATRIX" CACHE STRING "")
set(UBLAS_TESTSET_SPARSE_COO "USE_DOUBLE;USE_STD_COMPLEX;USE_UNBOUNDED_ARRAY;USE_COORDINATE_VECTOR;USE_COORDINATE_MATRIX" CACHE STRING "")

#  Sparse storage: USE_MAP_ARRAY USE_STD_MAP
#  Sparse vectors: USE_MAPPED_VECTOR USE_COMPRESSED_VECTOR USE_COORDINATE_VECTOR
#  Sparse matrices: USE_MAPPED_MATRIX USE_COMPRESSED_MATRIX USE_COORDINATE_MATRIX USE_MAPPED_VECTOR_OF_MAPPED_VECTOR USE_GENERALIZED_VECTOR_OF_VECTOR

# USE_RANGE USE_SLICE	 # Too complex for regression testing
# Generalize VofV still failing
#            USE_GENERALIZED_VECTOR_OF_VECTOR



# Project settings


# Test commented out because boost::interval does not behave like a scalar type
#      [ run test7.cpp
#            test71.cpp
#            test72.cpp
#            test73.cpp
#        : : :
#            <define>BOOST_UBLAS_USE_INTERVAL
#            <define>${UBLAS_TESTSET}
#      ]

#            <define>INTERAL
#            <define>SKIP_BAD
# TODO: Disable tests for now
# bcm_test(NAME test1 SOURCES test1.cpp)
# target_compile_definitions(test1 PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME test2 SOURCES test2.cpp)
# target_compile_definitions(test2 PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME test3 SOURCES test3.cpp)
# target_compile_definitions(test3 PUBLIC ${UBLAS_TESTSET_SPARSE})
# bcm_test(NAME test3_coo SOURCES test3.cpp)
# target_compile_definitions(test3_coo PUBLIC ${UBLAS_TESTSET_SPARSE_COO})
# bcm_test(NAME test3_mvov SOURCES test3.cpp)
# target_compile_definitions(test3_mvov PUBLIC USE_MAPPED_VECTOR_OF_MAPPED_VECTOR)
# bcm_test(NAME test4 SOURCES test4.cpp)
# target_compile_definitions(test4 PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME test5 SOURCES test5.cpp)
# target_compile_definitions(test5 PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME test6 SOURCES test6.cpp)
# target_compile_definitions(test6 PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME placement_new SOURCES placement_new.cpp)
# bcm_test(NAME concepts SOURCES concepts.cpp COMPILE_ONLY)
# target_compile_definitions(concepts PUBLIC EXTERNAL)
# bcm_test(NAME test_lu SOURCES test_lu.cpp)
# bcm_test(NAME triangular_access SOURCES triangular_access.cpp)
# target_compile_definitions(triangular_access PUBLIC NOMESSAGES)
# bcm_test(NAME triangular_layout SOURCES triangular_layout.cpp)
# bcm_test(NAME comp_mat_erase SOURCES comp_mat_erase.cpp)
# bcm_test(NAME sparse_view_test SOURCES sparse_view_test.cpp)
# bcm_test(NAME begin_end SOURCES begin_end.cpp)
# bcm_test(NAME num_columns SOURCES num_columns.cpp)
# bcm_test(NAME num_rows SOURCES num_rows.cpp)
# bcm_test(NAME ublas_size SOURCES size.cpp)
# bcm_test(NAME test_coordinate_matrix_sort SOURCES test_coordinate_matrix_sort.cpp)
# bcm_test(NAME test_coordinate_matrix_always_do_full_sort SOURCES test_coordinate_matrix_sort.cpp)
# target_compile_definitions(test_coordinate_matrix_always_do_full_sort PUBLIC BOOST_UBLAS_COO_ALWAYS_DO_FULL_SORT)
# bcm_test(NAME test_complex_norms SOURCES test_complex_norms.cpp)
# bcm_test(NAME test_assignment SOURCES test_assignment.cpp)
# target_compile_definitions(test_assignment PUBLIC BOOST_UBLAS_COO_ALWAYS_DO_FULL_SORT)
# bcm_test(NAME ublas_test_triangular SOURCES test_triangular.cpp)
# bcm_test(NAME test_ticket7296 SOURCES test_ticket7296.cpp)
# bcm_test(NAME test_inplace_solve_basic SOURCES test_inplace_solve.cpp)
# target_compile_definitions(test_inplace_solve_basic PUBLIC ${UBLAS_TESTSET})
# bcm_test(NAME test_inplace_solve_sparse SOURCES test_inplace_solve.cpp)
# target_compile_definitions(test_inplace_solve_sparse PUBLIC ${UBLAS_TESTSET_SPARSE_COO})
# bcm_test(NAME test_inplace_solve_mvov SOURCES test_inplace_solve.cpp)
# target_compile_definitions(test_inplace_solve_mvov PUBLIC USE_MAPPED_VECTOR_OF_MAPPED_VECTOR)
# bcm_test(NAME test_coordinate_vector_inplace_merge SOURCES test_coordinate_vector_inplace_merge.cpp)
# bcm_test(NAME test_coordinate_matrix_inplace_merge SOURCES test_coordinate_matrix_inplace_merge.cpp)
# bcm_test(NAME test_banded_storage_layout SOURCES test_banded_storage_layout.cpp)
# bcm_test(NAME test_fixed_containers SOURCES test_fixed_containers.cpp)
# bcm_test(NAME test_matrix_vector SOURCES test_matrix_vector.cpp)

