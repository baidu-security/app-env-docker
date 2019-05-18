#!/bin/bash

echo '[-] Starting dnsmqsq'
dnsmasq

host a.com 127.0.0.1

exec /etc/init.d/shell.sh /root/
