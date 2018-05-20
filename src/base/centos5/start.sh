#!/bin/bash

echo '[-] Downloading libs'
for x in libs64.tar.bz2 libs32.tar.bz2
do
	curl https://packages.baidu.com/app/centos5/$x -o $x
	tar -xf $x -C /
	rm -f $x
done

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}' | sed 's/addr://')
echo

exec /bin/bash
