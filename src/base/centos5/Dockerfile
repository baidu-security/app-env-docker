FROM centos:centos5

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 修正 repo
RUN  rm -f /etc/yum.repos.d/*
COPY repo/* /etc/yum.repos.d/

# 安装软件
RUN yum install -y epel-release yum-utils yum-downloadonly
# RUN yum install -y gcc-c++ make autoconf automake binutils bison flex yacc \
# 	wget curl zip unzip vim-enhanced bzip2 net-tools iproute lrzsz nc patch nano lsof rsync bind-utils \
# 	gettext git file lftp psmisc

# 其他配置
COPY *.sh .bash* .vimrc /root/
