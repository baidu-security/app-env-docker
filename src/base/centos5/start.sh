#!/bin/bash

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}' | sed 's/addr://')
echo

cd /root/scripts
exec /bin/bash
