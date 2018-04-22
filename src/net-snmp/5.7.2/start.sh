#!/bin/bash

echo '[-] Starting SNMP daemon'
snmpd

exec /etc/init.d/shell.sh /
