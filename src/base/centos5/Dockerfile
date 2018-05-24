FROM centos:centos5

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 修正 repo
RUN rm -rf /etc/yum.repos.d/* /var/cache/yum/* \
	&& sed 's/enabled=1/enabled=0/' -i /etc/yum/pluginconf.d/fastestmirror.conf
COPY repo/* /etc/yum.repos.d/

# 安装软件
RUN yum install -y yum-utils curl wget zip unzip vim-enhanced bzip2 \
	net-tools iproute lrzsz nc patch nano lsof rsync bind-utils \
	gettext file lftp psmisc which

RUN yum install -y gcc-c++ \
	glibc-devel glibc-devel.i386 \
	libstdc++-devel libstdc++-devel.i386 \
	ncurses-devel ncurses-devel.i386 \
	zlib-devel zlib-devel.i386 \
	readline-devel readline-devel.i386 \
	bzip2-devel bzip2-devel.i386 \
	libpcap-devel libpcap-devel.i386 \
	make autoconf automake binutils bison flex yacc pkgconfig strace

# 安装 python
RUN curl https://packages.baidu.com/app/centos5/python2.7.tar.bz2 -o /tmp/python.tar.bz2 \
	&& tar -xf /tmp/python.tar.bz2 -C / \
	&& rm -f python.tar.bz2

# musl-gcc
RUN curl https://packages.baidu.com/app/centos5/musl-1.1.10.tar.bz2 -o /tmp/musl.tar.bz2 \
	&& tar -xf /tmp/musl.tar.bz2 -C / \
	&& rm -f musl.tar.bz2	

# 其他配置
COPY *.sh .bash* .vimrc /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
