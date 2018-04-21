FROM centos:centos5

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 修正 repo
RUN  rm -rf /etc/yum.repos.d/* /var/cache/yum/*
COPY repo/* /etc/yum.repos.d/

# 预先下载的 RPM
ADD https://packages.baidu.com/app/centos5/yum.tar.gz /tmp/yum.tar.gz
RUN tar -xf /tmp/yum.tar.gz -C / \
	&& rm -f /tmp/yum.tar.gz

# 安装软件
RUN yum install -y epel-release yum-utils yum-downloadonly wget
RUN yum install -y gcc-c++ make autoconf automake binutils bison flex yacc \
	curl zip unzip vim-enhanced bzip2 net-tools iproute lrzsz nc patch nano lsof rsync bind-utils \
	gettext git file lftp psmisc

# 编译好的静态库，随时更新
ADD https://packages.baidu.com/app/centos5/libs.tar.bz2 /tmp/libs.tar.bz2
ADD https://packages.baidu.com/app/centos5/musl-1.1.10.tar.bz2 /tmp/musl.tar.bz2

RUN tar -xf /tmp/libs.tar.bz2 -C / \
	&& tar -xf /tmp/musl.tar.bz2 -C / \
	&& rm -f /tmp/libs.tar.bz2 /tmp/musl.tar.bz2

# 其他配置
COPY *.sh .bash* .vimrc /root/
COPY scripts/* /root/scripts/*
