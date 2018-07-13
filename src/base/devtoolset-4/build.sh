#!/bin/bash

set -ex

use_antlrcpp=0
php_version=$(echo "<?php echo phpversion(); ?>" | php)
extra_config_opt=
dest=/tmp/openrasp

if [[ -d "$dest" ]]; then
	cd "$dest"
	git pull
else
	git clone https://github.com/baidu/openrasp.git "$dest"
fi

# 可选: 使用 C++ 版本的 ANTLR；C++ 没有JIT快
# 
# if [[ $use_antlrcpp ]]; then
# 	wget https://packages.baidu.com/app/openrasp/libantlr4-linux.tar.gz -O /tmp/libantlr4.tar.gz
# 	tar -xf /tmp/libantlr4.tar.gz -C /tmp
# 	export extra_config_opt="--with-antlr4=/tmp/libantlr4"
# fi

source /opt/rh/devtoolset-4/enable

if [[ $php_version =~ ^7 ]]; then
	time bash "$dest"/build-php5.sh
else
	time bash "$dest"/build-php7.sh
fi

release=/tmp/rasp-php-$(date +%Y-%m-%d)
for x in /tmp/openrasp/rasp-php-*/*
do
	cp -R "$x" "$release"/
done
