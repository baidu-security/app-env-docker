#!/bin/bash

set -ex

use_antlrcpp=0
php_version=$(echo "<?php echo phpversion(); ?>" | php)
extra_config_opt=
dest=/tmp/openrasp

if ! [[ -d "$dest" ]]; then
	git clone https://github.com/baidu/openrasp.git "$dest"
fi

cd "$dest"
source /opt/rh/devtoolset-3/enable

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
