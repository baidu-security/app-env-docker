FROM centos:centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/nagiosxi-5.4.12.tar.gz

# 下载
RUN cd /tmp \
	&& curl "$install_url" -o package.tar.gz \
	&& tar -zxf package.tar.gz \
	&& rm -f package.tar.gz
