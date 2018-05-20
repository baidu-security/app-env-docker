FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV tomcat_ver 8.0.50
ENV tomcat_url https://packages.baidu.com/app/apache-tomcat-${tomcat_ver}.tar.gz

# 下载 Tomcat
RUN curl "$tomcat_url" -o package.tar.gz \
	&& tar -xf package.tar.gz \
	&& rm -f package.tar.gz \
	&& mv apache-tomcat-* /tomcat/

COPY conf/* /tomcat/conf/
COPY *.sh /root/

RUN chmod +x /tomcat/bin/*.sh /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
