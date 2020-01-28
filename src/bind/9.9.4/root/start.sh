#!/bin/bash

echo '[-] Starting Name daemon'
mkdir -p /var/named/dynamic
chmod 777 -R /run/named/ /var/named/
/usr/sbin/named

echo
echo '[-] Commands for testing purpose'
echo '    dig @127.0.0.1 example.com AXFR'
echo '    dig @127.0.0.1 -c CH -t txt version.bind'
echo '    dig @127.0.0.1 -t ANY example.com'
echo

exec /etc/init.d/shell.sh /

