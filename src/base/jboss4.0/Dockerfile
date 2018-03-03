FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV tomcat_url https://packages.baidu.com/app/jboss-4.0.5.GA.zip

# 下载JDK、Tomcat
RUN curl "$tomcat_url" -o jboss-4.0.5.GA.zip \
	&& unzip -q jboss-4.0.5.GA.zip \
	&& mv jboss-4.0.5.GA /jboss/ \
	&& rm -f jboss-4.0.5.GA.zip

# 其他配置
COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80
EXPOSE 8080
