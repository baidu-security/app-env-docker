export JAVA_HOME=/jdk
export HADOOP_HOME=/hadoop
export HADOOP_CONFDIR=$HADOOP_HOME/etc/hadoop
export HADOOP_LOG_DIR=$HOME/logs
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

export HDFS_NAMENODE_USER=hadoop
export YARN_NODEMANAGER_USER=hadoop
export HDFS_DATANODE_USER=hadoop
export YARN_RESOURCEMANAGER_USER=hadoop
export HDFS_SECONDARYNAMENODE_USER=hadoop

alias fs='hadoop fs'
