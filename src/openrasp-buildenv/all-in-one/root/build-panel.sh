#!/bin/bash

set -ex

dest=/tmp/openrasp
if ! [[ -d "$dest" ]]; then
	git clone https://github.com/baidu/openrasp.git "$dest"
fi

cd "$dest"

# npm config set registry https://registry.npm.taobao.org
# rm -rf /tmp/openrasp/rasp-vue/node_modules/
# ln -sf /root/node_modules/ /tmp/openrasp/rasp-vue/

go env -w GOPROXY=https://goproxy.cn
bash /tmp/openrasp/build-cloud.sh
