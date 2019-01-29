FROM openrasp/java6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV tomcat_ver 6.0.14
ENV tomcat_url https://packages.baidu.com/app/apache-tomcat-6/apache-tomcat-${tomcat_ver}.tar.gz

# 下载 Tomcat
RUN curl "$tomcat_url" -o apache-tomcat-${tomcat_ver}.tar.gz \
	&& tar -xf apache-tomcat-${tomcat_ver}.tar.gz \
	&& mv apache-tomcat-${tomcat_ver} /tomcat/ \
	&& rm -f apache-tomcat-${tomcat_ver}.tar.gz

# 其他配置
COPY *.sh /root/
COPY conf/* /tomcat/conf/

# 执行权限
RUN chmod +x /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
