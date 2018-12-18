FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN useradd -m -s /bin/bash work

RUN cd / \
	&& curl https://packages.baidu.com/app/elk-5.6.8/elasticsearch-5.6.8.tar.gz -o elasticsearch-5.6.8.tar.gz \
	&& tar -xf elasticsearch-5.6.8.tar.gz \
	&& rm -f elasticsearch-5.6.8.tar.gz \
	&& mv /elasticsearch-*/ /elasticsearch/ \
	&& chown work -R /elasticsearch/

RUN cd / \
	&& curl https://packages.baidu.com/app/mongodb-linux-x86_64-3.6.9.tgz -o mongodb-linux-x86_64-3.6.9.tgz \
	&& tar -xf mongodb-linux-x86_64-3.6.9.tgz \
	&& rm -f mongodb-linux-x86_64-3.6.9.tgz \
	&& mv /mongodb-*/ /mongodb/ \
	&& mkdir /mongodb/data/ /mongodb/log/ \
	&& chown work -R /mongodb/

ADD https://packages.baidu.com/app/openrasp/rasp-cloud.tar.gz /tmp

RUN cd /tmp/ \
	&& tar -xf rasp-cloud.tar.gz \
	&& rm -f rasp-cloud.tar.gz \
	&& mv /tmp/rasp-cloud-*/ /rasp-cloud

COPY app.conf /rasp-cloud/conf/	

COPY *.sh /root/
RUN chmod +x /root/*.sh

ENTRYPOINT ["/root/start.sh"]
