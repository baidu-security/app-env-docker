FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV tomcat_url https://packages.baidu.com/app/apache-tomcat-7.0.78.tar.gz
ENV jdk_url    https://packages.baidu.com/app/jdk-7u80-linux-x64.tar.gz

# 下载JDK、Tomcat
RUN curl "$jdk_url" -o jdk-7u80-linux-x64.tar.gz \
	&& tar -xf jdk-7u80-linux-x64.tar.gz \
	&& mv jdk1.7.0_80 /jdk/ \
	&& rm -f jdk-7u80-linux-x64.tar.gz

RUN curl "$tomcat_url" -o apache-tomcat-7.0.78.tar.gz \
	&& tar -xf apache-tomcat-7.0.78.tar.gz \
	&& mv apache-tomcat-7.0.78 /tomcat/ \
	&& rm -f apache-tomcat-7.0.78.tar.gz

# 其他配置
COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80
EXPOSE 8080
