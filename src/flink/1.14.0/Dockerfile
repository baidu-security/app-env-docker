FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/flink-1.14.0-bin-scala_2.11.tgz

RUN curl "$install_url" -o package.tar.gz \
	&& tar -xvf package.tar.gz \
	&& rm -f package.tar.gz \
	&& mv flink-* /flink

COPY start.sh /root/

EXPOSE 8081
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
