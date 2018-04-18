#!/bin/bash

export JAVA_HOME=/jdk
export PATH=$PATH:$JAVA_HOME/bin

echo '[-] Starting ZooKeeper'
/zk/bin/zkServer.sh start /zk/conf/zoo.cfg

echo '[-] Staring Solr Cloud'
/solr/bin/solr start -p 80 -a "-DzkHost=localhost:2181" -force

exec /etc/init.d/shell.sh /root/
