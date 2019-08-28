#!/bin/bash


dest=/tmp/openrasp-iast
if [[ -d "$dest" ]]; then
	cd "$dest"
	git pull
else
	git clone https://github.com/baidu-security/openrasp-iast /tmp/openrasp-iast
fi

cd /tmp/openrasp-iast/
make build

mv /tmp/openrasp-iast/openrasp_iast/dist/openrasp-iast /tmp/openrasp-iast/openrasp-iast-release
