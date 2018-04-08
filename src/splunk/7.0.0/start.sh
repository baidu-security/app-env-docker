#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Starting Splunk server'
/splunk/bin/splunk start --answer-yes --accept-license --no-prompt

echo '[-] Init splunk for the first time'
touch /splunk/etc/.ui_login
/splunk/bin/splunk edit user admin -password admin -role admin -auth admin:changeme
echo

echo '[-] Installing OpenRASP extension'
/splunk/bin/splunk install app /tmp/splunk-app-1.0.zip -auth admin:admin
echo

echo '[-] Adding TCP 5140 listener for OpenRASP'
/splunk/bin/splunk add tcp 5140 -auth admin:admin
echo

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /splunk/
/bin/bash
