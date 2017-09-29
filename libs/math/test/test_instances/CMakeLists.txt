
file(GLOB SOURCES *.cpp)
add_library(test_instances STATIC ${SOURCES})
target_link_libraries(test_instances boost_math)
