FROM centos:centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装软件
RUN rm -rf /etc/yum.repos.d/*
COPY etc/yum.repos.d /etc/yum.repos.d
RUN echo proxy=http://192.168.154.200:6666 >> /etc/yum.conf \
	&& sed 's/enabled=1/enabled=0/' -i /etc/yum/pluginconf.d/fastestmirror.conf
RUN rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6

RUN yum clean all
RUN yum install -y yum-utils scl-utils \
	wget curl zip unzip vim bzip2 net-tools iproute lrzsz nc patch nano lsof rsync bind-utils \
	python-pip gettext git file lftp psmisc xz policycoreutils-python inotify-tools \
	glibc.i686 gdb clang gcc-c++ python2-crypto glibc-devel zlib-static libcurl-devel \
	readline-devel xz-devel libicu-devel mpfr-devel pcre-devel

# 为PHP7.4升级sqlite3
RUN rpm -Uvh --force \
	https://packages.baidu.com/app/autoconf-2.69-12.2.noarch.rpm \
	https://packages.baidu.com/app/centos6/sqlite-3.7.17-4.el6.x86_64.rpm \
	https://packages.baidu.com/app/centos6/sqlite-devel-3.7.17-4.el6.x86_64.rpm \
	https://packages.baidu.com/app/centos6/libxml2-2.9.4-1.57.el6.x86_64.rpm \
	https://packages.baidu.com/app/centos6/libxml2-python-2.9.4-1.57.el6.x86_64.rpm \
	https://packages.baidu.com/app/centos6/libxml2-devel-2.9.4-1.57.el6.x86_64.rpm	

# cmake
RUN cd /tmp \
	&& curl https://packages.baidu.com/app/cmake-3.15.0-Linux-x86_64.tar.gz -o cmake.tar.gz \
	&& tar -xf cmake.tar.gz && rm -f cmake.tar.gz \
	&& mv cmake-*/ /usr/local/cmake \
	&& ln -s /usr/local/cmake/bin/cmake /usr/bin

# gcc 5.3
RUN curl https://packages.baidu.com/app/devtoolset-4.tar -o devtoolset-4.tar \
	&& tar -xf devtoolset-4.tar \
	&& rpm -ivh devtoolset-4/*.rpm \
	&& rm -rf devtoolset-4*

# jdk 6
RUN curl https://packages.baidu.com/app/jdk1.6.0_45.tar.bz2 -o jdk1.6.0_45.tar.bz2 \
	&& tar -xf jdk1.6.0_45.tar.bz2 \
	&& mv jdk1.6.0_45 /jdk/ \
	&& rm -f jdk1.6.0_45.tar.bz2

# maven 3.2.3
RUN cd /tmp \
	&& curl https://packages.baidu.com/app/apache-maven-3.2.3-bin.tar.gz -o mvn.tar.gz \
	&& tar -xf mvn.tar.gz \
	&& mv apache-maven-3.2.3/ /maven \
	&& rm -f mvn.tar.gz

# php 二进制释放: 5.3-5.6, 7.0-7.4, nts + zts
RUN cd /tmp \
	&& curl https://packages.baidu.com/app/php-bin-all.tar.gz -o all.tar.gz \
	&& tar -xf all.tar.gz -C /usr/local \
	&& rm -f all.tar.gz

# 其他配置
RUN sed '/^proxy=/d' -i /etc/yum.conf

# 统一修改时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

COPY root /root
COPY etc /etc

