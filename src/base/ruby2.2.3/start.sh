#!/bin/bash

echo '[-] Loading RVM'
source /etc/profile.d/rvm.sh

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /
/bin/bash
