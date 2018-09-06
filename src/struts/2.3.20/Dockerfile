FROM openrasp/tomcat8.0

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV struts_ver  2.3.20
ENV install_url https://packages.baidu.com/app/struts-${struts_ver}-apps.zip

# 下载
RUN curl "$install_url" -o package.zip \
	&& unzip -o -q package.zip \
	&& rm -f package.zip \
	&& mv struts-*/apps/struts2-showcase.war /tomcat/webapps/ \
	&& rm -rf struts-*

RUN mkdir /tomcat/webapps/struts2-showcase \
	&& cd /tomcat/webapps/struts2-showcase \
	&& unzip -o -q ../struts2-showcase.war

COPY struts-actionchaining.xml /tomcat/webapps/struts2-showcase/WEB-INF/classes/struts-actionchaining.xml
