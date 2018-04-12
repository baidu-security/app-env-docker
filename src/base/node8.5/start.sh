#!/bin/bash

echo '[-] Starting MySQL'
/etc/init.d/mysql.sh start

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /tmp
/bin/bash

