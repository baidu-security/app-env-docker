#!/bin/bash

# ssh 认证
ssh-keygen -f ~/.ssh/id_rsa -N ''
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 400 ~/.ssh/authorized_keys
ssh -oStrictHostKeyChecking=no hadoop@localhost exit

# zk
mkdir -p /tmp/zookeeper
/zookeeper/bin/zkServer.sh start

# hadoop
echo 'export JAVA_HOME=/jdk' >> /hadoop/etc/hadoop/hadoop-env.sh
mkdir -p /hadoop/logs /hadoop/logs
hdfs namenode -format

start-dfs.sh
start-yarn.sh

hadoop fs -mkdir -p /user/hadoop
hadoop fs -chown hadoop /user/hadoop
hdfs dfsadmin -setSpaceQuota 1t /user/hadoop

hadoop fs -ls /

