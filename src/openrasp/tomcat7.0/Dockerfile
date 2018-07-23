FROM openrasp/tomcat7.0

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# RASP 安装包
ADD https://packages.baidu.com/app/openrasp/rasp-java.tar.gz /tmp

# 测试用例
ADD https://packages.baidu.com/app/openrasp/vulns.war /tomcat/webapps/
ADD https://packages.baidu.com/app/openrasp/S2-016.war /tomcat/webapps/
ADD https://packages.baidu.com/app/openrasp/fastjson.war /tomcat/webapps/
ADD https://packages.baidu.com/app/openrasp/wxpay-xxe.war /tomcat/webapps/
ADD https://packages.baidu.com/app/openrasp/webdav-demo.war /tomcat/webapps/

RUN cd /tmp \
	&& tar -xf rasp-java.tar.* \
	&& /jdk/bin/java -jar rasp-*/RaspInstall.jar -install /tomcat/ \
	&& rm -rf rasp-*

RUN rm -rf /tomcat/webapps/ROOT/*
COPY web/index.jsp /tomcat/webapps/ROOT/

COPY start.sh /root/
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
