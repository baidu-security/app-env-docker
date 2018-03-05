FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN curl https://packages.baidu.com/app/solr-7.0.1.tgz -o /tmp/solr-7.0.1.tgz
RUN curl https://packages.baidu.com/app/zookeeper-3.3.6.tar.gz -o /tmp/zookeeper-3.3.6.tar.gz

# 下载
RUN cd /tmp \
	&& tar -xf solr-7.0.1.tgz \
	&& tar -xf zookeeper-3.3.6.tar.gz \
	&& mv solr-7.0.1 /solr \
	&& mv zookeeper-3.3.6 /zk \
	&& mkdir -p /tmp/zookeeper/

COPY zoo.cfg /zk/conf/
COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
