FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y glibc.i686

# 下载
RUN curl https://packages.baidu.com/app/weblogic-bea-10.3.6.tar.bz2 -o bea.tar.bz2 \
	&& tar xf bea.tar.bz2 -C /opt/ \
	&& rm -f bea.tar.bz2

COPY start.sh /root/
RUN sed -i 's#<listen-address/>#<listen-address>0.0.0.0</listen-address>#' /opt/bea/wlserver_10.3/samples/domains/medrec/config/

EXPOSE 7011 7012
