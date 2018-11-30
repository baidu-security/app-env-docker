#!/bin/bash

set -ex
dest=/tmp/openrasp

if ! [[ -d "$dest" ]]; then
	git clone -b 1.0rc1 https://github.com/baidu/openrasp.git "$dest"
fi

cd "$dest"
# rm -rf /tmp/openrasp/rasp-vue/node_modules/
ln -sf /root/node_modules/ /tmp/openrasp/rasp-vue/

bash /tmp/openrasp/build-cloud.sh
