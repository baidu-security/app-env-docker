#!/bin/bash

cd /tmp
curl https://github.com/antlr/antlr4/archive/4.7.1.tar.gz -o antlr.tar.gz
tar xf antlr.tar.gz
cd antlr4-4.7.1/runtime/Cpp
mkdir build
cd build
CXXFLAGS=-fPIC cmake -DCMAKE_INSTALL_PREFIX=/tmp/libantlr4 ..
make
make install
