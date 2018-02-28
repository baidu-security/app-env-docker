#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

/jdk/bin/java -jar /springboot.jar