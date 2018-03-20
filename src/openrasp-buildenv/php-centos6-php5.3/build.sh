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
time bash build-php.sh

mkdir -p /tmp/rasp-php-$(date +%Y-%m-%d)/
cp -R /tmp/openrasp/rasp-php-*/* /tmp/rasp-php-$(date +%Y-%m-%d)/

