FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y gcc-c++ make autoconf automake binutils bison flex yacc

# 编译好的静态库，随时更新
ADD https://packages.baidu.com/app/static-tools/libs.tar.bz2 /tmp/libs.tar.bz2
RUN tar -xf /tmp/libs.tar.bz2 -C / \
	&& rm -f /tmp/libs.tar.bz2

# 其他配置
COPY scripts /root/scripts/
COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
