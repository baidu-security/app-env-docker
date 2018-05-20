FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN curl https://packages.baidu.com/app/solr-7.0.1.tgz -o /tmp/solr.tar.gz
RUN curl https://packages.baidu.com/app/zookeeper-3.4.11.tar.gz -o /tmp/zookeeper.tar.gz

# 下载
RUN cd /tmp \
	&& tar -xf solr.tar.gz \
	&& tar -xf zookeeper.tar.gz \
	&& rm -f solr.tar.gz zookeeper.tar.gz \
	&& mv solr-* /solr \
	&& mv zookeeper-* /zk \
	&& mkdir -p /tmp/zookeeper/

COPY zoo.cfg /zk/conf/
COPY *.sh /root/
RUN chmod +x /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
