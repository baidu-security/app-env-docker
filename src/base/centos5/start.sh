#!/bin/bash

echo '[-] Extracting libs'
for x in /download/*.tar.bz2
do
	echo ' -  '$x
	tar -xf "$x" -C /
done
rm -rf /download/

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}' | sed 's/addr://')
echo

cd /root/scripts
exec /bin/bash
