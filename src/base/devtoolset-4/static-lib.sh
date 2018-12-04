#!/bin/bash

wget https://packages.baidu.com/app/openssl-1.1.0i.tar.gz
tar -xvf openssl-*.tar.gz
cd openssl-*/
CFLAGS="-fPIC" ./Configure --prefix=/tmp/static-lib linux-x86_64

wget https://packages.baidu.com/app/pcre-8.41.tar.bz2
tar -xvf pcre-*.tar.bz2
cd pcre-*
CFLAGS="-fPIC" ./configure --prefix=/tmp/static-lib/ --enable-static=yes --enable-shared=false

wget https://packages.baidu.com/app/curl-7.61.1.tar.bz2
tar -xvf curl-*.tar.bz2
cd curl-*
CFLAGS="-fPIC" ./configure --prefix=/tmp/static-lib --with-ssl=/tmp/static-lib/ --enable-static=yes --enable-shared=false

