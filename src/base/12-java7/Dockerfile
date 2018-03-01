FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV jdk_url https://packages.baidu.com/app/jdk-7u80-linux-x64.tar.gz

# 下载
RUN curl "$jdk_url" -o jdk-7u80-linux-x64.tar.gz \
	&& tar -xf jdk-7u80-linux-x64.tar.gz \
	&& mv jdk1.7.0_80 /jdk/ \
	&& rm -f jdk-7u80-linux-x64.tar.gz


