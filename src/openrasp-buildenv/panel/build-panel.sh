#!/bin/bash

set -ex
dest=/tmp/openrasp

if ! [[ -d "$dest" ]]; then
	git clone -b 1.0rc1 https://github.com/baidu/openrasp.git "$dest"
fi

cd "$dest"
tar -xf /root/bee-bin.tar -C cloud

# rm -rf /tmp/openrasp/rasp-vue/node_modules/
# ln -sf /root/node_modules/ /tmp/openrasp/rasp-vue/

. /opt/rh/devtoolset-3/enable
npm config set registry https://registry.npm.taobao.org

export NO_BEE_INSTALL=1
bash /tmp/openrasp/build-cloud.sh
