FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/jdk-8u144-linux-x64.tar.gz
RUN curl "$install_url" -o /tmp/jdk-8u144-linux-x64.tar.gz \
	&& tar -xf /tmp/jdk-8u144-linux-x64.tar.gz \
	&& mv jdk1.8.0_144 /jdk/ \
	&& rm -f jdk-8u144-linux-x64.tar.gz

