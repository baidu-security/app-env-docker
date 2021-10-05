#!/bin/bash

echo '[-] Starting flink'
export JAVA_HOME=/jdk
/flink/bin/start-cluster.sh

exec /etc/init.d/shell.sh /root
