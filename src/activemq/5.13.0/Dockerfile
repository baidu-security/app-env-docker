FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/apache-activemq-5.13.0-bin.tar.gz

# 下载
RUN cd /tmp \
	&& curl "$install_url" -o package.tar.gz \
	&& tar xf package.tar.gz \
	&& rm -f package.tar.gz \
	&& mv apache-activemq-* /activemq

COPY *.sh /root/
COPY jetty.xml /activemq/conf

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80 8161