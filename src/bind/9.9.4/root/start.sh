#!/bin/bash

echo '[-] Starting Name daemon'
mkdir -p /var/named/dynamic
chmod 777 -R /run/named/ /var/named/
/usr/sbin/named

echo '[-] To launch zone transfer'
echo ' -  dig @127.0.0.1 example.com AXFR'
echo ' -  dig @127.0.0.1 example.com XFR'
echo

echo '[-] To retrieve NAMED version'
echo ' -  dig @127.0.0.1 -c CH -t txt version.bind'

dig @127.0.0.1 example.com AXFR

exec /etc/init.d/shell.sh /

