#!/bin/bash

set -ex
version=$(php -r 'echo PHP_MAJOR_VERSION, ".", PHP_MINOR_VERSION;')
output=/tmp/openrasp-release/centos6-php${version}-x64
source /opt/rh/devtoolset-3/enable

cd /tmp/openrasp-php
phpize --clean
phpize
./configure --with-v8=/libv8 -q
make

mkdir -p "$output"
cp modules/openrasp.so "$output"/

