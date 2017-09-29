BCM
===

Boost cmake modules.

Motivation
----------

This provides cmake modules that can be re-used by boost and other dependencies. It provides modules to reduce the boilerplate for installing, versioning, setting up package config, and creating tests.

Usage
-----

The modules can be installed using standard cmake install:

    mkdir build
    cd build
    cmake ..
    cmake --build . --target install

Once installed, the modules can be used by using `find_package` and then including the appropriate module:

    find_package(BCM)
    include(BCMPackage)

Documentation
-------------

http://bcm.readthedocs.io

