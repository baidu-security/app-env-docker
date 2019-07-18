FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y centos-release-scl \
	&& yum install -y scl-utils policycoreutils-python mpfr-devel glibc-devel zlib-static libcurl-devel pcre-devel clang gcc-c++ \
	&& rpm -Uvh --force https://packages.baidu.com/app/autoconf-2.69-12.2.noarch.rpm

# cmake
RUN cd /tmp \
	&& curl https://packages.baidu.com/app/cmake-3.15.0-Linux-x86_64.tar.gz -o cmake.tar.gz \
	&& tar -xf cmake.tar.gz && rm -f cmake.tar.gz \
	&& mv cmake-3.14.* /usr/local/cmake \
	&& ln -s /usr/local/cmake/bin/cmake /usr/bin

# git-lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | bash \
	&& yum install -y git-lfs \
	&& git lfs install

# gcc 5.3
RUN curl https://packages.baidu.com/app/devtoolset-4.tar -o devtoolset-4.tar \
	&& tar -xf devtoolset-4.tar \
	&& rpm -ivh devtoolset-4/*.rpm \
	&& rm -rf devtoolset-4*

# 安装 REMI 仓库
RUN curl https://packages.baidu.com/app/remi/remi-release-6.rpm -o /tmp/remi-release-6.rpm \
	&& rpm -ivh /tmp/remi-release-6.rpm \
	&& rm -f /tmp/remi-release-6.rpm

# 其他配置
COPY *.sh /root/
RUN chmod +x /root/*.sh

