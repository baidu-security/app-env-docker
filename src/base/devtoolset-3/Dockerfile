FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y centos-release-scl \
	&& yum install -y scl-utils policycoreutils-python mpfr-devel glibc-devel libcurl-devel pcre-devel

# gcc 4.9.1
RUN curl https://packages.baidu.com/app/devtoolset-3.tar -o devtoolset-3.tar \
	&& tar -xf devtoolset-3.tar \
	&& rpm -ivh devtoolset-3/*.rpm \
	&& rm -rf devtoolset-3*

# 安装 REMI 仓库
RUN curl https://packages.baidu.com/app/remi/remi-release-6.rpm -o /tmp/remi-release-6.rpm \
	&& rpm -ivh /tmp/remi-release-6.rpm \
	&& rm -f /tmp/remi-release-6.rpm

# 其他配置
COPY *.sh /root/
RUN chmod +x /root/*.sh

