#!/bin/bash

export JAVA_HOME=/jdk/
export PATH=$PATH:/jdk/bin/

echo '[-] Starting ZooKeeper'
/zk/bin/zkServer.sh start /zk/conf/zoo.cfg

echo '[-] Staring Solr Cloud'
/solr/bin/solr start -a "-DzkHost=localhost:2181" -force

echo '[-] Creating data'
/solr/bin/solr create -c Urahara -force
/solr/bin/post -c Urahara /solr/example/exampledocs/*.xml

echo '[-] Dropping shell'
echo ' -  HostName:   ' $(hostname)
echo ' -  IP address: ' $(ifconfig eth0 | awk '/inet / {print $2}')
echo

cd /
/bin/bash
