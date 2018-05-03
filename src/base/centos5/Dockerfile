FROM centos:centos5

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 修正 repo
RUN rm -rf /etc/yum.repos.d/* /var/cache/yum/* \
	&& sed 's/enabled=1/enabled=0/' -i /etc/yum/pluginconf.d/fastestmirror.conf
COPY repo/* /etc/yum.repos.d/

# 安装软件
RUN yum install -y epel-release yum-utils curl
RUN yum install -y gcc-c++ libstdc++ libstdc++.i386 glibc-devel glibc-devel.i386 \
	libstdc++-devel libstdc++-devel.i386 zlib-devel \
	make autoconf automake binutils bison flex \
	wget zip unzip vim-enhanced bzip2 net-tools iproute lrzsz nc patch nano lsof rsync bind-utils \
	gettext file lftp psmisc \
	git yacc

# 编译好的静态库，随时更新
ADD https://packages.baidu.com/app/centos5/libs64.tar.bz2 /download/libs64.tar.bz2
ADD https://packages.baidu.com/app/centos5/libs32.tar.bz2 /download/libs32.tar.bz2
ADD https://packages.baidu.com/app/centos5/musl-1.1.10.tar.bz2 /download/musl.tar.bz2

# 安装 UPX
RUN curl https://packages.baidu.com/app/upx-3.94-amd64-bin -o /usr/bin/upx \
	&& chmod +x /usr/bin/upx

# 其他配置
COPY *.sh .bash* .vimrc /root/
COPY scripts/ /root/scripts/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
