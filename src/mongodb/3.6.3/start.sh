#!/bin/bash

export PATH=/mongodb/bin:$PATH

echo '[-] Starting MongoDB'
echo never > /sys/kernel/mm/transparent_hugepage/enabled
mongod --dbpath /mongodb/data/ --fork --logpath /mongodb/logs --bind_ip_all

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /
/bin/bash

