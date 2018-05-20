FROM openrasp/tomcat7.0

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/jenkins-war-1.636.war
ENV install_path /tomcat/webapps/

# 下载
RUN rm -rf /tomcat/webapps/ \
	&& mkdir -p /tomcat/webapps/ \
	&& curl "$install_url" -o "$install_path"/ROOT.war


