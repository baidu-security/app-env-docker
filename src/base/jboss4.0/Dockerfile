FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV jboss_url https://packages.baidu.com/app/jboss-4.0.5.GA.zip

# 下载JDK、Tomcat
RUN curl "$jboss_url" -o jboss.zip \
	&& unzip -q jboss.zip \
	&& rm -f jboss.zip \
	&& mv jboss-*/ /jboss/	

# 其他配置
COPY start.sh /root/
COPY server.xml /jboss/server/default/deploy/jbossweb-tomcat55.sar/server.xml

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
