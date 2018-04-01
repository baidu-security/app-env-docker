#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting Splunk server'
/splunk/bin/splunk start --answer-yes --accept-license --no-prompt

echo
echo '[-] Installing OpenRASP extension'
/splunk/bin/splunk install app /tmp/splunk-app-1.0.zip -auth admin:changeme

echo
echo '[-] Adding TCP 5140 listener for OpenRASP'
/splunk/bin/splunk add tcp 5140 -auth admin:changeme

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /splunk/
/bin/bash
