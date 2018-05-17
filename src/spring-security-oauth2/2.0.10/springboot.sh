#!/bin/bash

set -x
killall java

if [[ $1 == "rasp" ]]; then
	if [[ ! -f /rasp/rasp.jar ]]; then
		bash -i -c rasp-install
	fi
	
	/jdk/bin/java -javaagent:"/rasp/rasp.jar" -Dlog4j.rasp.configuration="file:///rasp/conf/rasp-log4j.xml" -jar /root/springboot.jar --server.port=80 --server.address=0.0.0.0
else
	/jdk/bin/java -jar /root/springboot.jar --server.port=80 --server.address=0.0.0.0
fi
