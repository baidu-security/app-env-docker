FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 下载
RUN curl https://packages.baidu.com/app/weblogic/weblogic-12.2.1.3.tar.bz2 -o weblogic.tar.bz2 \
	&& tar xf weblogic.tar.bz2 -C / \
	&& rm -f weblogic.tar.bz2

RUN sed -i 's#<listen-address/>#<listen-address>0.0.0.0</listen-address>#' /wls12213/domain/base_domain/config/config.xml

COPY start.sh /root/

EXPOSE 7001 8453
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
