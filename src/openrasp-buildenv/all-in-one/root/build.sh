#!/bin/bash
dest=/tmp/openrasp

# 必须是合法的 openrasp 源码目录
if [[ ! -f "$dest"/build-php7.sh ]] || [[ ! -f "$dest"/build-php5.sh ]]; then
	echo Invalid openrasp source folder in $dest
	exit 1
fi

# 必须有新版 gcc
if [[ ! -f /opt/rh/devtoolset-4/enable ]]; then
	echo devtoolset-4 is required to build php extension
	exit 1
fi

# 必须有PHP
php_version=$(php -r 'echo phpversion();')
if [[ -z "$php_version" ]]; then
	echo PHP is not available
	exit 1
fi

# 开始编译
source /opt/rh/devtoolset-4/enable
set -ex

if [[ $php_version =~ ^5 ]]; then
	time bash "$dest"/build-php5.sh
else
	time bash "$dest"/build-php7.sh
fi
