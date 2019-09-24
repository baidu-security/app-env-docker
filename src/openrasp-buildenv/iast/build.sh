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

DATE=$(TZ=UTC-8 date -d @`git log -n 1 --pretty="%cd" --date=raw | cut -d " " -f 1` +'%Y%m%d%H%M%S')
#mv /tmp/openrasp-iast/openrasp_iast/dist/openrasp-iast /tmp/openrasp-iast/openrasp-iast-${DATE}
mv /tmp/openrasp-iast/openrasp_iast/dist/openrasp-iast /tmp/openrasp-iast/openrasp-iast-latest
