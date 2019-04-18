#!/bin/bash
set -x

cd /tmp/
curl -L https://github.com/baidu-security/openrasp-v8/archive/master.zip -o openrasp-v8.zip
unzip -o -qq openrasp-v8.zip
rm -f openrasp-v8.zip

mkdir openrasp-v8-master/php/build
cd openrasp-v8-master/php/build
cmake3 -DCMAKE_CXX_COMPILER=clang++ ..
make

