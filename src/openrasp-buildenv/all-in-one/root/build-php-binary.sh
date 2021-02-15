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

declare -A php_versions
php_versions[5.3]=https://packages.baidu.com/app/php-5.3/php-5.3.27.tar.bz2
php_versions[5.4]=https://packages.baidu.com/app/php-5.4/php-5.4.45.tar.bz2
php_versions[5.5]=https://packages.baidu.com/app/php-5.5/php-5.5.38.tar.bz2
php_versions[5.6]=https://packages.baidu.com/app/php-5.6/php-5.6.40.tar.bz2
php_versions[7.0]=https://packages.baidu.com/app/php-7.0/php-7.0.33.tar.bz2
php_versions[7.1]=https://packages.baidu.com/app/php-7.1/php-7.1.9.tar.bz2
php_versions[7.2]=https://packages.baidu.com/app/php-7.2/php-7.2.14.tar.bz2
php_versions[7.3]=https://packages.baidu.com/app/php-7.3/php-7.3.17.tar.bz2
php_versions[7.4]=https://packages.baidu.com/app/php-7.4/php-7.4.15.tar.bz2

for ver in ${!php_versions[@]}
do
	url=${php_versions[$ver]}

	if [[ ! -f /usr/local/php/$ver/bin/php ]]; then
		build_php $url /usr/local/php/$ver
	else
		echo Skipped existing PHP version $ver
	fi

	if [[ ! -f /usr/local/php/$ver-ts/bin/php ]]; then
		build_php $url /usr/local/php/$ver-ts --enable-maintainer-zts
	else
		echo Skipped existing PHP-TS version $ver
	fi
done




