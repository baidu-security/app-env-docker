#!/bin/bash

export JAVA_HOME=/jdk/

echo '[-] Setting license to Free'
cat >> /splunk/etc/system/local/server.conf << EOF

[license]
active_group = Free
EOF

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
/splunk/bin/splunk add tcp 5140 -auth admin:admin -sourcetype openrasp
echo

exec /etc/init.d/shell.sh /splunk
