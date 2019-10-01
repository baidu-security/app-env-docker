export JAVA_HOME=/jdk
export HADOOP_HOME=/hadoop
export HADOOP_CONFDIR=$HADOOP_HOME/etc/hadoop
export HADOOP_LOG_DIR=$HOME/logs

export HIVE_HOME=/hive/
export HBASE_HOME=/hbase/

export HDFS_NAMENODE_USER=hadoop
export YARN_NODEMANAGER_USER=hadoop
export HDFS_DATANODE_USER=hadoop
export YARN_RESOURCEMANAGER_USER=hadoop
export HDFS_SECONDARYNAMENODE_USER=hadoop

export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HIVE_HOME/bin:$HBASE_HOME/bin

alias fs='hadoop fs'
