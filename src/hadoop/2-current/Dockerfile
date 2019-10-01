FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN useradd hadoop
RUN yum install -y openssh-server

RUN curl https://packages.baidu.com/app/hadoop-2/hadoop-2.8.5.tar.gz -o hadoop.tar.gz \
	&& tar -xf hadoop.tar.gz -C / \
	&& rm -f hadoop.tar.gz \
	&& mv /hadoop-* /hadoop \
	&& chown hadoop -R /hadoop/

RUN curl https://packages.baidu.com/app/zookeeper-3.3.6.tar.gz -o zookeeper.tar.gz \
	&& tar -xf zookeeper.tar.gz -C / \
	&& rm -f zookeeper.tar.gz \
	&& mv /zookeeper-* /zookeeper \
	&& chown hadoop -R /zookeeper

RUN curl https://packages.baidu.com/app/hadoop-2/hbase-2.2.1-bin.tar.gz -o hbase.tar.gz \
	&& tar -xf hbase.tar.gz -C / \
	&& rm -f hbase.tar.gz \
	&& mv /hbase-* /hbase \
	&& chown hadoop -R /hbase

RUN curl https://packages.baidu.com/app/hadoop-2/apache-hive-2.3.6-bin.tar.gz -o apache-hive-3.1.2-bin.tar.gz \
	&& tar -xf apache-hive-3.1.2-bin.tar.gz -C / \
	&& rm -f apache-hive-3.1.2-bin.tar.gz \
	&& mv /apache-hive-* /hive \
	&& chown hadoop -R /hive	

COPY hadoop/* /hadoop/etc/hadoop/
COPY zookeeper/zoo.cfg /zookeeper/conf/
COPY hive/* /hive/conf/

COPY etc etc

COPY *.sh /tmp/
RUN chmod +x /tmp/*.sh
ENTRYPOINT ["/bin/bash", "/tmp/start.sh"]
