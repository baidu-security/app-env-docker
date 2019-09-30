FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN useradd hadoop
RUN yum install -y openssh-server

RUN curl https://packages.baidu.com/app/hadoop-3/hadoop-3.2.1.tar.gz -o hadoop.tar.gz \
	&& tar -xf hadoop.tar.gz -C / \
	&& rm -f hadoop.tar.gz \
	&& mv /hadoop-* /hadoop \
	&& chown hadoop -R /hadoop/

RUN curl https://packages.baidu.com/app/zookeeper-3.3.6.tar.gz -o zookeeper.tar.gz \
	&& tar -xf zookeeper.tar.gz -C / \
	&& rm -f zookeeper.tar.gz \
	&& mv /zookeeper-* /zookeeper \
	&& chown hadoop -R /zookeeper

COPY hadoop/* /hadoop/etc/hadoop/
COPY zookeeper/zoo.cfg /zookeeper/conf/

COPY etc etc

COPY *.sh /tmp/
RUN chmod +x /tmp/*.sh
ENTRYPOINT ["/bin/bash", "/tmp/start.sh"]
