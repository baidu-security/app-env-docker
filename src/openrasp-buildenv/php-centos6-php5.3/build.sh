#!/bin/bash

set -ex
output=/tmp/openrasp-release/centos6-php5.3-x64
source /opt/rh/devtoolset-3/enable

cd /tmp/openrasp-php
phpize --clean
phpize
./configure --with-v8=/libv8 -q
make

mkdir -p "$output"
cp modules/openrasp.so "$output"/

