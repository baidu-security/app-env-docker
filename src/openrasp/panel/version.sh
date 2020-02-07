#!/bin/bash

version=${1:latest}

cd /tmp
curl "https://packages.baidu.com/app/openrasp/release/${version}/rasp-cloud.tar.gz" -o - | tar -xzf -

pidof rasp-cloud 1>/dev/null && killall rasp-cloud
rm -rf /rasp-cloud

mv /tmp/rasp-cloud-*/ /rasp-cloud
cp /root/app.conf /rasp-cloud/conf

cd /rasp-cloud
./rasp-cloud -d

