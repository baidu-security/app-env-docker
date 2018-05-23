FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV jboss_url https://packages.baidu.com/app/jboss-as-7.1.1.Final.zip

# 下载JDK、Tomcat
RUN curl "$jboss_url" -o jboss.zip \
	&& unzip -q jboss.zip \
	&& rm -f jboss.zip \
	&& mv jboss-*/ /jboss/	

# 其他配置
COPY start.sh /root/
COPY standalone.xml /jboss/standalone/configuration/standalone.xml

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
