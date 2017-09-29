include(BCMTest)

find_package(boost_tuple)
find_package(boost_utility)

bcm_test_link_libraries(boost_flyweight
boost::tuple
boost::utility
)

# See http://www.boost.org/libs/flyweight for library home page.

add_library(intermod_holder_dll intermod_holder_dll.cpp)
bcm_mark_as_test(intermod_holder_dll)
bcm_target_link_test_libs(intermod_holder_dll)
if(BUILD_SHARED_LIBS)
target_compile_definitions(intermod_holder_dll PUBLIC BOOST_FLYWEIGHT_TEST_INTERMOD_HOLDER_DLL_SOURCE=1)
endif()

bcm_test(NAME test_assoc_cont_factory SOURCES test_assoc_cont_factory.cpp test_assoc_cont_fact_main.cpp)
bcm_test(NAME test_basic SOURCES test_basic.cpp test_basic_main.cpp)
bcm_test(NAME test_custom_factory SOURCES test_custom_factory.cpp test_custom_factory_main.cpp)
bcm_test(NAME test_init SOURCES test_init.cpp test_init_main.cpp)
bcm_test(NAME test_intermod_holder SOURCES test_intermod_holder.cpp test_intermod_holder_main.cpp)
target_link_libraries(test_intermod_holder intermod_holder_dll)

bcm_test(NAME test_multictor SOURCES test_multictor.cpp test_multictor_main.cpp)
bcm_test(NAME test_no_locking SOURCES test_no_locking.cpp test_no_locking_main.cpp)
bcm_test(NAME test_no_tracking SOURCES test_no_tracking.cpp test_no_tracking_main.cpp)
bcm_test(NAME test_serialization SOURCES test_serialization.cpp test_serialization_main.cpp)
bcm_test(NAME test_set_factory SOURCES test_set_factory.cpp test_set_factory_main.cpp)



