
#ifndef GUARD_SIMPLE_H
#define GUARD_SIMPLE_H

#include <thread>

#if !defined(HAS_SIMPLE) || DEFINE_3 !=3
#error "Not configured"
#endif

inline void simple()
{
    std::thread([]{}).join();
}


#endif
