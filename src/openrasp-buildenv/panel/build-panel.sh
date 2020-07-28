#!/bin/bash

set -ex
. /opt/rh/devtoolset-3/enable

dest=/tmp/openrasp
if ! [[ -d "$dest" ]]; then
	git clone https://github.com/baidu/openrasp.git "$dest"
fi

cd "$dest"

tar -xf /root/bee-bin.tar -C cloud
mkdir -p /root/go
curl https://packages.baidu.com/app/openrasp/cloud-files/pkg.tar.gz -o - | tar -xzf - -C /root/go

# npm config set registry https://registry.npm.taobao.org
# rm -rf /tmp/openrasp/rasp-vue/node_modules/
# ln -sf /root/node_modules/ /tmp/openrasp/rasp-vue/

export NO_BEE_INSTALL=1
export NO_GOMOD_DOWNLOAD=1
bash /tmp/openrasp/build-cloud.sh
