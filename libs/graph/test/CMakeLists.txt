include(BCMTest)

find_package(boost_test)
find_package(boost_timer)
find_package(boost_assign)
find_package(boost_filesystem)

bcm_test_link_libraries(boost_graph
boost::test
boost::timer
boost::assign
boost::filesystem
)

# Copyright (c) 2002 Trustees of Indiana University
#
# Distributed under the Boost Software License, Version 1.0.
# (See accompanying file LICENSE_1_0.txt or copy at
# http://www.boost.org/LICENSE_1_0.txt)

# Define SGB (stanford graph base top level directory) and
# LEDA (also top level directory) at the command line of jam using -s

set(TEST_DIR ${CMAKE_CURRENT_SOURCE_DIR})
set(PLANAR_INPUT_FILES ${CMAKE_CURRENT_SOURCE_DIR}/planar_input_graphs)
set(CYCLE_RATIO_INPUT_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cycle_ratio_s382.90.dot)
set(METIS_INPUT_FILE ${CMAKE_CURRENT_SOURCE_DIR}/weighted_graph.gr)

bcm_test(NAME test_graphs SOURCES test_graphs.cpp)
bcm_test(NAME index_graph SOURCES index_graph.cpp)
bcm_test(NAME labeled_graph SOURCES labeled_graph.cpp)
bcm_test(NAME finish_edge_bug SOURCES finish_edge_bug.cpp)

bcm_test(NAME transitive_closure_test SOURCES transitive_closure_test.cpp)
bcm_test(NAME adj_list_cc SOURCES adj_list_cc.cpp COMPILE_ONLY)


bcm_test(NAME adj_list_edge_list_set SOURCES adj_list_edge_list_set.cpp)
bcm_test(NAME adj_list_loops SOURCES adj_list_loops.cpp)
bcm_test(NAME adj_matrix_cc SOURCES adj_matrix_cc.cpp COMPILE_ONLY)
bcm_test(NAME bfs SOURCES bfs.cpp)
bcm_test(NAME bfs_cc SOURCES bfs_cc.cpp COMPILE_ONLY)
bcm_test(NAME bellman-test SOURCES bellman-test.cpp)
bcm_test(NAME betweenness_centrality_test SOURCES betweenness_centrality_test.cpp)
bcm_test(NAME bidir_remove_edge SOURCES bidir_remove_edge.cpp)
bcm_test(NAME bipartite_test SOURCES bipartite_test.cpp)
bcm_test(NAME csr_graph_test SOURCES csr_graph_test.cpp)
bcm_test(NAME dag_longest_paths SOURCES dag_longest_paths.cpp)
bcm_test(NAME dfs SOURCES dfs.cpp)
bcm_test(NAME undirected_dfs SOURCES undirected_dfs.cpp)
bcm_test(NAME dfs_cc SOURCES dfs_cc.cpp COMPILE_ONLY)
bcm_test(NAME dijkstra_cc SOURCES dijkstra_cc.cpp COMPILE_ONLY)
bcm_test(NAME dijkstra_heap_performance SOURCES dijkstra_heap_performance.cpp ARGS 10000)
bcm_test(NAME dijkstra_no_color_map_compare SOURCES dijkstra_no_color_map_compare.cpp ARGS 10000)
bcm_test(NAME dominator_tree_test SOURCES dominator_tree_test.cpp)
bcm_test(NAME relaxed_heap_test SOURCES relaxed_heap_test.cpp ARGS 5000 15000)
bcm_test(NAME edge_list_cc SOURCES edge_list_cc.cpp COMPILE_ONLY)
bcm_test(NAME filtered_graph_cc SOURCES filtered_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME generator_test SOURCES generator_test.cpp)
bcm_test(NAME graph SOURCES graph.cpp)
bcm_test(NAME graph_concepts SOURCES graph_concepts.cpp COMPILE_ONLY)
bcm_test(NAME graphviz_test SOURCES graphviz_test.cpp)
bcm_test(NAME metis_test SOURCES metis_test.cpp ARGS ${METIS_INPUT_FILE})
bcm_test(NAME gursoy_atun_layout_test SOURCES gursoy_atun_layout_test.cpp)
bcm_test(NAME layout_test SOURCES layout_test.cpp)

# TODO: Skip serialization, since this requires grap_parallel
# bcm_test(NAME serialize SOURCES serialize.cpp)

bcm_test(NAME reverse_graph_cc SOURCES reverse_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME sequential_vertex_coloring SOURCES sequential_vertex_coloring.cpp)

bcm_test(NAME subgraph SOURCES subgraph.cpp)
bcm_test(NAME subgraph_bundled SOURCES subgraph_bundled.cpp)
bcm_test(NAME subgraph_props SOURCES subgraph_props.cpp)

bcm_test(NAME isomorphism SOURCES isomorphism.cpp)
bcm_test(NAME adjacency_matrix_test SOURCES adjacency_matrix_test.cpp)
bcm_test(NAME vector_graph_cc SOURCES vector_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME copy SOURCES copy.cpp COMPILE_ONLY)
bcm_test(NAME swap SOURCES swap.cpp COMPILE_ONLY)
bcm_test(NAME property_iter SOURCES property_iter.cpp COMPILE_ONLY)
bcm_test(NAME bundled_properties SOURCES bundled_properties.cpp)
bcm_test(NAME floyd_warshall_test SOURCES floyd_warshall_test.cpp)
bcm_test(NAME astar_search_test SOURCES astar_search_test.cpp)
bcm_test(NAME biconnected_components_test SOURCES biconnected_components_test.cpp)
bcm_test(NAME cuthill_mckee_ordering SOURCES cuthill_mckee_ordering.cpp)
bcm_test(NAME king_ordering SOURCES king_ordering.cpp)
bcm_test(NAME matching_test SOURCES matching_test.cpp)
bcm_test(NAME max_flow_test SOURCES max_flow_test.cpp)
bcm_test(NAME boykov_kolmogorov_max_flow_test SOURCES boykov_kolmogorov_max_flow_test.cpp)
bcm_test(NAME cycle_ratio_tests SOURCES cycle_ratio_tests.cpp ARGS ${CYCLE_RATIO_INPUT_FILE})
bcm_test(NAME basic_planarity_test SOURCES basic_planarity_test.cpp)
bcm_test(NAME make_connected_test SOURCES make_connected_test.cpp)
bcm_test(NAME make_bicon_planar_test SOURCES make_bicon_planar_test.cpp)
bcm_test(NAME make_maximal_planar_test SOURCES make_maximal_planar_test.cpp)
bcm_test(NAME named_vertices_test SOURCES named_vertices_test.cpp)
bcm_test(NAME all_planar_input_files_test SOURCES all_planar_input_files_test.cpp ARGS ${PLANAR_INPUT_FILES})
bcm_test(NAME parallel_edges_loops_test SOURCES parallel_edges_loops_test.cpp ARGS ${PLANAR_INPUT_FILES})
bcm_test(NAME r_c_shortest_paths_test SOURCES r_c_shortest_paths_test.cpp)
bcm_test(NAME rcsp_custom_vertex_id SOURCES rcsp_custom_vertex_id.cpp)
bcm_test(NAME is_straight_line_draw_test SOURCES is_straight_line_draw_test.cpp)
bcm_test(NAME metric_tsp_approx SOURCES metric_tsp_approx.cpp ARGS metric_tsp_approx.graph)
bcm_test(NAME dimacs SOURCES dimacs.cpp COMPILE_ONLY)
bcm_test(NAME bron_kerbosch_all_cliques SOURCES bron_kerbosch_all_cliques.cpp)
bcm_test(NAME tiernan_all_cycles SOURCES tiernan_all_cycles.cpp)
bcm_test(NAME closeness_centrality SOURCES closeness_centrality.cpp)
bcm_test(NAME degree_centrality SOURCES degree_centrality.cpp)
bcm_test(NAME mean_geodesic SOURCES mean_geodesic.cpp)
bcm_test(NAME eccentricity SOURCES eccentricity.cpp)
bcm_test(NAME clustering_coefficient SOURCES clustering_coefficient.cpp)
bcm_test(NAME core_numbers_test SOURCES core_numbers_test.cpp)
bcm_test(NAME read_propmap SOURCES read_propmap.cpp)
bcm_test(NAME mcgregor_subgraphs_test SOURCES mcgregor_subgraphs_test.cpp)
bcm_test(NAME grid_graph_cc SOURCES grid_graph_cc.cpp COMPILE_ONLY)
bcm_test(NAME grid_graph_test SOURCES grid_graph_test.cpp)
bcm_test(NAME incremental_components_test SOURCES incremental_components_test.cpp)
bcm_test(NAME two_graphs_common_spanning_trees_test SOURCES two_graphs_common_spanning_trees_test.cpp)
bcm_test(NAME random_spanning_tree_test SOURCES random_spanning_tree_test.cpp)
bcm_test(NAME graphml_test SOURCES graphml_test.cpp ARGS "graphml_test.xml")
bcm_test(NAME mas_test SOURCES mas_test.cpp ARGS ${TEST_DIR})
bcm_test(NAME stoer_wagner_test SOURCES stoer_wagner_test.cpp ARGS ${TEST_DIR})
bcm_test(NAME filtered_graph_properties_dijkstra SOURCES filtered_graph_properties_dijkstra.cpp COMPILE_ONLY)
bcm_test(NAME vf2_sub_graph_iso_test SOURCES vf2_sub_graph_iso_test.cpp)
bcm_test(NAME vf2_sub_graph_iso_test_2 SOURCES vf2_sub_graph_iso_test_2.cpp)
bcm_test(NAME hawick_circuits SOURCES hawick_circuits.cpp)
bcm_test(NAME successive_shortest_path_nonnegative_weights_test SOURCES successive_shortest_path_nonnegative_weights_test.cpp)
bcm_test(NAME cycle_canceling_test SOURCES cycle_canceling_test.cpp)
bcm_test(NAME strong_components_test SOURCES strong_components_test.cpp)
bcm_test(NAME find_flow_cost_bundled_properties_and_named_params_test SOURCES find_flow_cost_bundled_properties_and_named_params_test.cpp)
bcm_test(NAME max_flow_algorithms_bundled_properties_and_named_params SOURCES max_flow_algorithms_bundled_properties_and_named_params.cpp)

# Run SDB tests only when -DSDB=1 is set.
if(SDB)
bcm_test(NAME stanford_graph_cc SOURCES stanford_graph_cc.cpp COMPILE_ONLY)
endif()

# Run LEDA tests only when -DLEDA=1 is set.
if(LEDA)
bcm_test(NAME leda_graph_cc SOURCES leda_graph_cc.cpp COMPILE_ONLY)
endif()

