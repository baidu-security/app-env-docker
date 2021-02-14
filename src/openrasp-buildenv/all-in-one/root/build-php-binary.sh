#!/bin/bash

root=$PWD
set -x

build_php()
{
	url=$1
	prefix=$2
	args=$3

	rm -rf php-*
	curl "$url" -o php-src.tar.bz2
	tar -xf php-src.tar.bz2

	cd php-*/
	./configure -q --prefix=$prefix --disable-cgi --disable-fpm $args
	make install
	cd -

	rm -rf php-*
}

build_php https://packages.baidu.com/app/php-5.3/php-5.3.27.tar.bz2 /usr/local/php/5.3
build_php https://packages.baidu.com/app/php-5.3/php-5.3.27.tar.bz2 /usr/local/php/5.3-ts --enable-maintainer-zts

build_php https://packages.baidu.com/app/php-5.4/php-5.4.45.tar.bz2 /usr/local/php/5.4
build_php https://packages.baidu.com/app/php-5.4/php-5.4.45.tar.bz2 /usr/local/php/5.4-ts --enable-maintainer-zts

build_php https://packages.baidu.com/app/php-5.5/php-5.5.38.tar.bz2 /usr/local/php/5.5
build_php https://packages.baidu.com/app/php-5.5/php-5.5.38.tar.bz2 /usr/local/php/5.5-ts --enable-maintainer-zts

build_php https://packages.baidu.com/app/php-5.6/php-5.6.40.tar.bz2 /usr/local/php/5.6
build_php https://packages.baidu.com/app/php-5.6/php-5.6.40.tar.bz2 /usr/local/php/5.6-ts --enable-maintainer-zts

build_php https://packages.baidu.com/app/php-7.0/php-7.0.33.tar.bz2 /usr/local/php/7.0
build_php https://packages.baidu.com/app/php-7.0/php-7.0.33.tar.bz2 /usr/local/php/7.0-ts --enable-maintainer-zts

build_php https://packages.baidu.com/app/php-7.1/php-7.1.9.tar.bz2 /usr/local/php/7.1
build_php https://packages.baidu.com/app/php-7.1/php-7.1.9.tar.bz2 /usr/local/php/7.1-ts --enable-maintainer-zts

build_php https://packages.baidu.com/app/php-7.2/php-7.2.14.tar.bz2 /usr/local/php/7.2
build_php https://packages.baidu.com/app/php-7.2/php-7.2.14.tar.bz2 /usr/local/php/7.2-ts --enable-maintainer-zts

build_php https://packages.baidu.com/app/php-7.3/php-7.3.17.tar.bz2 /usr/local/php/7.3
build_php https://packages.baidu.com/app/php-7.3/php-7.3.17.tar.bz2 /usr/local/php/7.3-ts --enable-maintainer-zts

build_php https://packages.baidu.com/app/php-7.4/php-7.4.15.tar.bz2 /usr/local/php/7.4
build_php https://packages.baidu.com/app/php-7.4/php-7.4.15.tar.bz2 /usr/local/php/7.4-ts --enable-maintainer-zts

