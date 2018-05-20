FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y gcc-c++ make autoconf automake binutils bison flex yacc pkgconfig strace

RUN yum install -y \
	glibc-static glibc-devel libstdc++-devel ncurses-devel ncurses-static zlib-devel readline-devel

# musl-gcc
RUN curl https://packages.baidu.com/app/static-tools/musl-1.1.10.tar.bz2 -o /tmp/musl.tar.bz2 \
	&& tar -xf /tmp/musl.tar.bz2 -C / \
	&& rm -f /tmp/musl.tar.bz2

# 其他配置
COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

