#!/bin/bash

for ver in 5.{3..6} 7.{0..3}
do
	export PATH=/usr/local/php-${ver}/bin/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/jdk/bin 
	/root/build.sh
done
