FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV tomcat_url https://packages.baidu.com/app/apache-tomcat-6.0.43.tar.gz
ENV jdk_url    https://packages.baidu.com/app/jdk1.6.0_45.tar.bz2

# 下载JDK、Tomcat
RUN wget "$jdk_url" \
	&& tar -xf jdk1.6.0_45.tar.bz2 \
	&& mv jdk1.6.0_45 /jdk/ \
	&& rm -f jdk1.6.0_45.tar.bz2

RUN wget "$tomcat_url" \
	&& tar -xf apache-tomcat-6.0.43.tar.gz \
	&& mv apache-tomcat-6.0.43 /tomcat/ \
	&& rm -f apache-tomcat-6.0.43.tar.gz

# 其他配置
COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80
EXPOSE 8080

