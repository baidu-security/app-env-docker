#!/bin/bash

set -ex

use_antlrcpp=1
extra_config_opt=
dest=/tmp/openrasp

if [[ -d "$dest" ]]; then
	cd "$dest"
	git pull
else
	git clone https://github.com/baidu/openrasp.git "$dest"
fi

# C++ 版本的 ANTLR，性能是 JS 版本的100倍
if [[ $use_antlrcpp ]]; then
	wget https://packages.baidu.com/app/openrasp/libantlr4-linux.tar.gz -O /tmp/libantlr4.tar.gz
	tar -xf /tmp/libantlr4.tar.gz -C /tmp
	export extra_config_opt="--with-antlr4=/tmp/libantlr4"
fi

source /opt/rh/devtoolset-4/enable
time bash "$dest"/build-php.sh

release=/tmp/rasp-php-$(date +%Y-%m-%d)
for x in /tmp/openrasp/rasp-php-*/*
do
	cp -R "$x" "$release"/
done
