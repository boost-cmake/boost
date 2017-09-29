include(BCMTest)


bcm_test_link_libraries(boost_align
)

# Copyright 2014-2015 Glen Joseph Fernandes
# (glenjofe@gmail.com)
#
# Distributed under the Boost Software License, Version 1.0.
# (http://www.boost.org/LICENSE_1_0.txt)


bcm_test(NAME align_test SOURCES align_test.cpp)
bcm_test(NAME align_down_test SOURCES align_down_test.cpp)
bcm_test(NAME align_up_test SOURCES align_up_test.cpp)
bcm_test(NAME aligned_alloc_test SOURCES aligned_alloc_test.cpp)
bcm_test(NAME aligned_allocator_test SOURCES aligned_allocator_test.cpp)
bcm_test(NAME aligned_allocator_adaptor_test SOURCES aligned_allocator_adaptor_test.cpp)
bcm_test(NAME aligned_delete_test SOURCES aligned_delete_test.cpp)
bcm_test(NAME alignment_of_test SOURCES alignment_of_test.cpp)
bcm_test(NAME assume_aligned_test SOURCES assume_aligned_test.cpp)
bcm_test(NAME is_aligned_test SOURCES is_aligned_test.cpp)

