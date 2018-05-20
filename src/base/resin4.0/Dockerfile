FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV resin_url https://packages.baidu.com/app/resin-4.0.56.tar.gz

# 下载
RUN curl "$resin_url" -o resin.tar.gz \
	&& tar -xf resin.tar.gz \
	&& rm -f resin.tar.gz \
	&& mv resin-4*/ /resin/

# 其他配置
COPY start.sh /root/
COPY resin.conf /resin/conf/resin.conf

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
