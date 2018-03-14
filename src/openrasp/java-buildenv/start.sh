#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Building OpenRASP'
/root/build.sh

echo
echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

echo '[-] To build OpenRASP again, do'
echo '-   /root/build.sh'

cd /
/bin/bash
