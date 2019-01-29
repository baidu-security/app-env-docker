FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV tomcat_ver 7.0.78
ENV tomcat_url https://packages.baidu.com/app/apache-tomcat-7/apache-tomcat-${tomcat_ver}.tar.gz

# 下载 Tomcat
RUN curl "$tomcat_url" -o package.tar.gz \
	&& tar -xf package.tar.gz \
	&& rm -f package.tar.gz \
	&& mv apache-tomcat-* /tomcat/

# 安装 JMX remote
RUN curl https://packages.baidu.com/app/groovy-all-2.3.9.jar -o /tomcat/lib/groovy-all-2.3.9.jar \
	&& curl https://packages.baidu.com/app/tomcat-catalina-jmx-remote-7.0.4.jar -o /tomcat/lib/catalina-jmx-remote.jar

# 启动脚本
COPY start.sh /root/

# 其他配置
COPY bin/* /tomcat/bin/
COPY conf/* /tomcat/conf/

# 执行权限
RUN chmod +x /tomcat/bin/*.sh /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80 10001

