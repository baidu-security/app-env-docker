#!/bin/bash

export JAVA_HOME=/jdk/
export PATH=$PATH:/jdk/bin/

echo '[-] Starting ZooKeeper'
/zk/bin/zkServer.sh start /zk/conf/zoo.cfg

echo '[-] Staring Solr Cloud'
/solr/bin/solr start -p 80 -a "-DzkHost=localhost:2181" -force

echo '[-] Creating data'
/solr/bin/solr create -c Urahara -force
/solr/bin/post -p 80 -c Urahara /solr/example/exampledocs/*.xml

exec /etc/init.d/shell.sh /
