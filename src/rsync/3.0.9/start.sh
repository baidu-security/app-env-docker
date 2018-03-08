#!/bin/bash

echo '[-] Starting rsync daemon'
rsync --daemon

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /
/bin/bash

