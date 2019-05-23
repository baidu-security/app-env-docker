#!/bin/bash

function build_php()
{
	url=$1
	version=$2

	cd /tmp
	curl "$url" -o php.tar.bz2 && tar -xf php.tar.bz2 && rm -f php.tar.bz2

	cd php-${version}*
	./configure --prefix=/usr/local/php-${version} -q
	make install
}

build_php https://packages.baidu.com/app/php-5.3/php-5.3.27.tar.bz2 5.3
build_php https://packages.baidu.com/app/php-5.4/php-5.4.45.tar.bz2 5.4
build_php https://packages.baidu.com/app/php-5.5/php-5.5.38.tar.bz2 5.5
build_php https://packages.baidu.com/app/php-5.6/php-5.6.40.tar.bz2 5.6
build_php https://packages.baidu.com/app/php-7.0/php-7.0.33.tar.bz2 7.0
build_php https://packages.baidu.com/app/php-7.1/php-7.1.9.tar.bz2  7.1
build_php https://packages.baidu.com/app/php-7.2/php-7.2.14.tar.bz2 7.2
build_phphttps://packages.baidu.com/app/php-7.3/php-7.3.0.tar.bz2   7.3

