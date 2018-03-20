#!/bin/bash

set -ex
php_version=$(php -r 'echo PHP_MAJOR_VERSION, ".", PHP_MINOR_VERSION;')
php_arch=$(uname -m)

output=/tmp/rasp-php-$(date +%Y%m%d)/php/linux-php${php_version}-${php_arch}
source /opt/rh/devtoolset-3/enable

cd /tmp/openrasp-php
phpize --clean
phpize
./configure --with-v8=/libv8 --with-gettext -q
make

mkdir -p "$output"
cp modules/openrasp.so "$output"/
make distclean
phpize --clean
