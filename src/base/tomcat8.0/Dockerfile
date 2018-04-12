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

# 下载 OpenRASP 安装脚本
ADD https://raw.githubusercontent.com/baidu/openrasp/master/rasp-install/remote/linux/centos-java.sh /root/install-openrasp.sh

RUN chmod +x /tomcat/bin/*.sh /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80