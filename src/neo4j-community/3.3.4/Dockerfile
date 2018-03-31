FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN cd / \
	&& curl https://packages.baidu.com/app/neo4j-community-3.3.4-unix.tar.gz -o neo4j.tar.gz \
	&& tar -xf /neo4j.tar.gz \
	&& mv neo4j-community-3.3.4 /neo4j

COPY neo4j.conf /neo4j/conf/
COPY *.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 7474
EXPOSE 7687
