#!/bin/bash

export JAVA_HOME=/jdk/

set -ex

dest=/tmp/openrasp
if [[ -d "$dest" ]]; then
	cd "$dest"
	git pull
else
	git clone https://github.com/baidu/openrasp.git /tmp/openrasp
fi

time bash /tmp/openrasp/build.sh

mkdir -p /tmp/openrasp-release/java
cp /tmp/openrasp/rasp-java.* /tmp/openrasp-release/java/
