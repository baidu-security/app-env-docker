FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# WTF，官方只有 devtoolset 6和7了？
RUN yum install -y centos-release-scl \
	&& yum install -y scl-utils policycoreutils-python mpfr-devel glibc-devel libcurl-devel pcre-devel pcre-static

RUN curl https://packages.baidu.com/app/devtoolset-4.tar -o devtoolset-4.tar \
	&& tar -xf devtoolset-4.tar \
	&& rpm -ivh devtoolset-4/*.rpm \
	&& rm -rf devtoolset-4*

# 原先安装 devtools-4 的方法
# RUN yum install -y centos-release-scl \
# 	&& yum install -y devtoolset-4-gcc-c++ make cmake re2c libuuid-devel libxml2-devel zlib-devel

# 安装 REMI 仓库
RUN curl https://packages.baidu.com/app/remi/remi-release-6.rpm -o /tmp/remi-release-6.rpm \
	&& rpm -ivh /tmp/remi-release-6.rpm \
	&& rm -f /tmp/remi-release-6.rpm

# 其他配置
COPY *.sh /root/
RUN chmod +x /root/*.sh

# 不能加 entrypoint，否则影响自动发布系统
# ENTRYPOINT ["/bin/bash", "/root/start.sh"]
