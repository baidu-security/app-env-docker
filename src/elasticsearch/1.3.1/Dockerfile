FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV es_url https://packages.baidu.com/app/elasticsearch-1.3.1.tar.gz

RUN curl "$es_url" -o elasticsearch-1.3.1.tar.gz \
	&& tar xf elasticsearch-1.3.1.tar.gz \
	&& mv elasticsearch-1.3.1 /elasticsearch/ \
	&& rm -f elasticsearch-1.3.1.tar.gz

# 其他配置
COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 9200
EXPOSE 80
