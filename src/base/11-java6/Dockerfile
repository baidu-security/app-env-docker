FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV jdk_url https://packages.baidu.com/app/jdk1.6.0_45.tar.bz2

# 下载JDK、Tomcat
RUN curl "$jdk_url" -o jdk1.6.0_45.tar.bz2 \
	&& tar -xf jdk1.6.0_45.tar.bz2 \
	&& mv jdk1.6.0_45 /jdk/ \
	&& rm -f jdk1.6.0_45.tar.bz2

