include(BCMTest)

find_package(boost_test)
find_package(boost_random)

bcm_test_link_libraries(boost_polygon
boost::test
boost::random
)

# test/Jamfile.v2 controls building of Polygon Library unit tests
#
# Copyright (c) 2010 Intel Corporation
#
# Use, modification and distribution is subject to the Boost Software License,
# Version 1.0. (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)



bcm_test(NAME polygon_point_test SOURCES polygon_point_test.cpp)
bcm_test(NAME polygon_segment_test SOURCES polygon_segment_test.cpp)
bcm_test(NAME polygon_interval_test SOURCES polygon_interval_test.cpp)
bcm_test(NAME polygon_rectangle_test SOURCES polygon_rectangle_test.cpp)
bcm_test(NAME polygon_rectangle_formation_test SOURCES polygon_rectangle_formation_test.cpp)
bcm_test(NAME polygon_set_data_test SOURCES polygon_set_data_test.cpp)
bcm_test(NAME polygon_90_data_test SOURCES polygon_90_data_test.cpp)
bcm_test(NAME gtl_boost_unit_test SOURCES gtl_boost_unit_test.cpp)

bcm_test(NAME voronoi_builder_test SOURCES voronoi_builder_test.cpp)
bcm_test(NAME voronoi_ctypes_test SOURCES voronoi_ctypes_test.cpp)
bcm_test(NAME voronoi_diagram_test SOURCES voronoi_diagram_test.cpp)
bcm_test(NAME voronoi_geometry_type_test SOURCES voronoi_geometry_type_test.cpp)
bcm_test(NAME voronoi_predicates_test SOURCES voronoi_predicates_test.cpp)
bcm_test(NAME voronoi_robust_fpt_test SOURCES voronoi_robust_fpt_test.cpp)
bcm_test(NAME voronoi_structures_test SOURCES voronoi_structures_test.cpp)



