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

# clang & cmake 3
RUN yum install -y clang
RUN cd /tmp \
	&& curl https://packages.baidu.com/app/cmake-3.14.2-Linux-x86_64.tar.gz -o /tmp/cmake.tar.gz \
	&& tar -xf cmake.tar.gz \
	&& rm -f cmake.tar.gz \
	&& mv cmake-*/ /usr/local/cmake \
	&& ln -s /usr/local/cmake/bin/cmake /usr/bin

# 其他配置
COPY *.sh /root/
RUN chmod +x /root/*.sh

