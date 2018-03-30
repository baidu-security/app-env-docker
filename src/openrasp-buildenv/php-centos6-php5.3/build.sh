#!/bin/bash

set -ex

dest=/tmp/openrasp
if [[ -d "$dest" ]]; then
	cd "$dest"
	git pull
else
	git clone https://github.com/baidu/openrasp.git /tmp/openrasp
fi

source /opt/rh/devtoolset-3/enable
time bash /tmp/openrasp/build-php.sh

release=/tmp/rasp-php-$(date +%Y-%m-%d)/
for x in /tmp/openrasp/rasp-php-*/*
do
	cp -R "$x" "$release"/
done


