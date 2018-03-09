FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV tomcat_url https://packages.baidu.com/app/apache-tomcat-7.0.78.tar.gz

# 下载 Tomcat
RUN curl "$tomcat_url" -o apache-tomcat-7.0.78.tar.gz \
	&& tar -xf apache-tomcat-7.0.78.tar.gz \
	&& mv apache-tomcat-7.0.78 /tomcat/ \
	&& rm -f apache-tomcat-7.0.78.tar.gz

# 其他配置
COPY start.sh /root/
COPY conf/* /tomcat/conf/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80
EXPOSE 8080
