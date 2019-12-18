FROM openrasp/tomcat6.0

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# RASP 安装包
ADD https://packages.baidu.com/app/openrasp/release/latest/rasp-java.tar.gz /tmp

# 测试用例
ADD https://packages.baidu.com/app/openrasp/testcases/vulns.war /tomcat/webapps/
ADD https://packages.baidu.com/app/openrasp/testcases/S2-016.war /tomcat/webapps/
ADD https://packages.baidu.com/app/openrasp/testcases/fastjson.war /tomcat/webapps/
ADD https://packages.baidu.com/app/openrasp/testcases/wxpay-xxe.war /tomcat/webapps/
ADD https://packages.baidu.com/app/webdav-demo.war /tomcat/webapps/

RUN cd /tmp \
	&& tar -xf rasp-java.tar.* \
	&& /jdk/bin/java -jar rasp-*/RaspInstall.jar -install /tomcat/ \
	&& rm -rf rasp-*

RUN curl https://packages.baidu.com/app/openrasp/999-event-logger.js -o /tomcat/rasp/plugins/999-event-logger.js

RUN rm -rf /tomcat/webapps/ROOT/*

COPY web/index.jsp /tomcat/webapps/ROOT/
