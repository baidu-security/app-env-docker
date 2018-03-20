#!/bin/bash

set -ex
export JAVA_HOME=/jdk/

dest=/tmp/openrasp
if [[ -d "$dest" ]]; then
	cd "$dest"
	git pull
else
	git clone https://github.com/baidu/openrasp.git /tmp/openrasp
fi

source /opt/rh/devtoolset-3/enable
time bash build-php.sh

mkdir -p /tmp/openrasp-release/php
cp /tmp/openrasp/rasp-php.tar.bz2 /tmp/openrasp-release/php/

