FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV resin_url https://packages.baidu.com/app/resin-3/resin-3.1.16.zip

# 下载
RUN curl "$resin_url" -o package.zip \
	&& unzip -qq package.zip \
	&& rm -f package.zip \
	&& mv resin-3*/ /resin/

# 其他配置
COPY start.sh /root/
COPY resin.conf /resin/conf/resin.conf

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
