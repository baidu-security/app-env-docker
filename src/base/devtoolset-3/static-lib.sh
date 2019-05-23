#!/bin/bash

set -ex

cd /tmp
wget https://packages.baidu.com/app/openssl-1.0.2q.tar.gz -O openssl-1.0.2q.tar.gz
tar -xf openssl-*.tar.gz
cd openssl-*/
CC='gcc -fPIC' ./Configure --prefix=/tmp/static-lib no-shared linux-x86_64
make
make install
rm -rf /tmp/openssl-*

cd /tmp
wget https://packages.baidu.com/app/pcre-8.41.tar.bz2 -O pcre-8.41.tar.bz2
tar -xf pcre-*.tar.bz2
cd pcre-*
CFLAGS="-fPIC" CXXFLAGS="-fPIC" ./configure --prefix=/tmp/static-lib/ --enable-static=yes --enable-shared=false -q
make
make install
rm -rf /tmp/pcre-*

cd /tmp
wget https://packages.baidu.com/app/curl-7.64.1.tar.bz2 -O curl-7.64.1.tar.bz2
tar -xf curl-*.tar.bz2
cd curl-*
CFLAGS="-fPIC" CXXFLAGS="-fPIC" ./configure --prefix=/tmp/static-lib --with-ssl=/tmp/static-lib/ --enable-static=yes --enable-shared=false -q
make
make install
rm -rf /tmp/curl-*

