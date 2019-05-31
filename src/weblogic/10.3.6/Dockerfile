FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 下载
RUN curl https://packages.baidu.com/app/weblogic/weblogic-bea-10.3.6.tar.bz2 -o bea.tar.bz2 \
	&& tar xf bea.tar.bz2 -C /opt/ \
	&& rm -f bea.tar.bz2

RUN sed -i 's#<listen-address/>#<listen-address>0.0.0.0</listen-address>#' /opt/bea/wlserver_10.3/samples/domains/medrec/config/config.xml
RUN yum install -y libgcc \
	&& yum install -y libgcc.i686

COPY start.sh /root/
COPY exploit  /exploit/

EXPOSE 7011 7012
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
