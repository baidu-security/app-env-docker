#!/bin/bash

echo '[-] Starting SNMP daemon'
snmpd

echo '[-] Running snmpwalk command'
snmpwalk -v2c -c c0nfig 172.17.0.2 | head -5
echo ...snip...

exec /etc/init.d/shell.sh /
