#!/bin/bash

set -ex
cd "$(dirname "$0")"

php_version=$(php -r "echo PHP_MAJOR_VERSION, '.', PHP_MINOR_VERSION;")
php_arch=$(uname -m)
php_os=$(uname -s)

cp openrasp.ini /etc/php.d
cp php/linux-php${php_version}-${php_arch}/openrasp.so /usr/lib64/php/modules
cp -R rasp /opt
chmod 777 -R /opt/rasp

