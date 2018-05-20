#!/bin/bash

export PATH=/mongodb/bin:$PATH

echo '[-] Starting MongoDB'
echo never > /sys/kernel/mm/transparent_hugepage/enabled
mongod --dbpath /mongodb/data/ --fork --logpath /mongodb/logs --bind_ip_all

exec /etc/init.d/shell.sh /