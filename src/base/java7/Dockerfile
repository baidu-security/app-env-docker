FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV jdk_ver 7u17
ENV jdk_url https://packages.baidu.com/app/jdk-${jdk_ver}-linux-x64.tar.gz

# 下载
RUN curl "$jdk_url" -o jdk.tar.gz \
	&& tar -xf jdk.tar.gz \
	&& mv jdk1.7.0_* /jdk/ \
	&& rm -f jdk.tar.gz
