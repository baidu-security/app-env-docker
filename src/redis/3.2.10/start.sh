#!/bin/bash

echo '[-] Starting Redis'
nohup redis-server &> /var/log/redis.log &

echo '[-] Waiting for redis to start'
while true
do
	redis-cli -h 127.0.0.1 ping 2>/dev/null && break
	sleep 1
done

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /
/bin/bash
