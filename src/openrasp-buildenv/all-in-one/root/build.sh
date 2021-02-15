#!/bin/bash
# 在编译机，github 经常无法 pull，需要走代理
# 所以 docker 内部不再尝试 pull，统一再外部更新

dest=/tmp/openrasp

if [[ -z "$php_version" ]]; then
	echo PHP_VERSION must be set
	exit 1
fi

if [[ ! -f "$dest"/build-php7.sh ]] || [[ ! -f "$dest"/build-php5.sh ]]; then
	echo Invalid openrasp source folder in $dest
	exit 1
fi

if [[ ! -f /opt/rh/devtoolset-4/enable ]]; then
	echo devtoolset-4 is required to build php extension
	exit 1
fi

source /opt/rh/devtoolset-4/enable
set -ex

if [[ $php_version =~ ^7 ]]; then
	time bash "$dest"/build-php7.sh
else
	time bash "$dest"/build-php5.sh
fi

release=/tmp/rasp-php-$(date +%Y-%m-%d)
for x in /tmp/openrasp/rasp-php-*/*
do
	cp -R "$x" "$release"/
done
