FROM centos:centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/xxx.tar.gz


# 下载
COPY nagiosxi-5.4.12.tar.gz /tmp/package.tar.gz
# curl "$install_url" -o package.tar.gz \
RUN cd /tmp \
	&& tar -zxf package.tar.gz \
	&& rm -f package.tar.gz



