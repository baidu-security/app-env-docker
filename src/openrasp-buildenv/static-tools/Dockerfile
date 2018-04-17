FROM openrasp/centos6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y gcc-c++ make autoconf automake binutils bison flex yacc

COPY scripts /root/scripts/
COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]