FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV tomcat_url https://packages.baidu.com/app/apache-tomcat-7.0.78.tar.gz

# 下载 Tomcat
RUN curl "$tomcat_url" -o apache-tomcat-7.0.78.tar.gz \
	&& tar -xf apache-tomcat-7.0.78.tar.gz \
	&& mv apache-tomcat-7.0.78 /tomcat/ \
	&& rm -f apache-tomcat-7.0.78.tar.gz

# 安装 JMX remote
RUN curl https://packages.baidu.com/app/groovy-all-2.3.9.jar -o /tomcat/lib/groovy-all-2.3.9.jar \
	&& curl http://central.maven.org/maven2/org/apache/tomcat/tomcat-catalina-jmx-remote/7.0.4/tomcat-catalina-jmx-remote-7.0.4.jar -o /tomcat/lib/catalina-jmx-remote.jar

# 其他配置
COPY start.sh /root/

COPY bin/* /tomcat/bin/
COPY conf/* /tomcat/conf/

RUN chmod +x /tomcat/bin/*.sh /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80
EXPOSE 8080
