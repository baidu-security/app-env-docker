FROM openrasp/tomcat8.0

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV struts_ver  2.5.12
ENV install_url https://packages.baidu.com/app/struts-${struts_ver}-apps.zip

# 下载
RUN curl "$install_url" -o package.zip \
	&& unzip package.zip \
	&& rm -f package.zip \
	&& mv struts-2.5.12/apps/*.war /tomcat/webapps/ \
	&& rm -rf struts-*

