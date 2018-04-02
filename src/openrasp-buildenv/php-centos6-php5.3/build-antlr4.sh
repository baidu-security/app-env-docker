#!/bin/bash

set -ex

dest=/tmp/openrasp
if [[ -d "$dest" ]]; then
	cd "$dest"
	git pull
else
	git clone https://github.com/baidu/openrasp.git /tmp/openrasp
fi

wget https://packages.baidu.com/app/openrasp/libantlr4-linux.tar.gz -O /tmp/libantlr4.tar.gz
tar -xf /tmp/libantlr4.tar.gz -C /tmp

source /opt/rh/devtoolset-4/enable
time extra_config_opt="--with-antlr4=/tmp/libantlr4" bash /tmp/openrasp/build-php.sh

release=/tmp/rasp-php-$(date +%Y-%m-%d)/
for x in /tmp/openrasp/rasp-php-*/*
do
	cp -R "$x" "$release"/
done
