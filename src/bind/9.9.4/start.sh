#!/bin/bash

echo '[-] Starting Name daemon'
mkdir -p /var/named/dynamic
chmod 777 -R /run/named/ /var/named/
/usr/sbin/named

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

echo '[-] To launch zone transfer'
echo ' -  dig @127.0.0.1 example.com AXFR'

dig @127.0.0.1 example.com AXFR

cd /
/bin/bash

