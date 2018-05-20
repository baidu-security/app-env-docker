#!/bin/bash

echo '[-] Downloading libs'
for x in libs64.tar.bz2 libs32.tar.bz2
do
	curl https://packages.baidu.com/app/static-tools/$x -o $x
	tar -xf $x -C /
	rm -f $x
done

/etc/init.d/shell.sh /root
