#!/bin/bash

echo '[-] Starting MySQL'
/etc/init.d/mysql.sh start

echo '[-] Starting Express server'
echo '    - Logging to server.log'
cd /tmp/express-4.13.1/examples/static-files/
nohup node index.js &> server.log &

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

/bin/bash

