FROM openrasp/java6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV tomcat_url https://packages.baidu.com/app/apache-tomcat-6.0.43.tar.gz

# 下载 Tomcat
RUN curl "$tomcat_url" -o apache-tomcat-6.0.43.tar.gz \
	&& tar -xf apache-tomcat-6.0.43.tar.gz \
	&& mv apache-tomcat-6.0.43 /tomcat/ \
	&& rm -f apache-tomcat-6.0.43.tar.gz

# 其他配置
COPY *.sh /root/
COPY conf/* /tomcat/conf/

# 执行权限
RUN chmod +x /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
