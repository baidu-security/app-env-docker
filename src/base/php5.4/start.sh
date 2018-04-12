#!/bin/bash

echo '[-] Starting Apache'
apachectl -k start

echo '[-] Starting MySQL'
/etc/init.d/mysql.sh start

echo '[-] Accessing 127.0.0.1 for the first time'
# 奇怪的BUG，第一次必然卡住
curl 127.0.0.1 -m 1 &>/dev/null
curl -I 127.0.0.1

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /var/www/html
/bin/bash

