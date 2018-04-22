FROM openrasp/java7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV es_url https://packages.baidu.com/app/elasticsearch-1.1.1.tar.gz

RUN curl "$es_url" -o elasticsearch.tar.gz \
	&& tar xf elasticsearch.tar.gz \
	&& rm -f elasticsearch.tar.gz \
	&& mv elasticsearch-*/ /elasticsearch/

# 其他配置
COPY start.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 9200
