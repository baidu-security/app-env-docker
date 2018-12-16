FROM openrasp/devtoolset-3

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN cd / \
	&& curl https://packages.baidu.com/app/elk-5.6.8/elasticsearch-5.6.8.tar.gz -o elasticsearch-5.6.8.tar.gz \
	&& tar -xf elasticsearch-5.6.8.tar.gz \
	&& rm -f elasticsearch-5.6.8.tar.gz

RUN cd / \
	&& curl https://packages.baidu.com/app/mongodb-linux-x86_64-3.6.9.tgz -o mongodb-linux-x86_64-3.6.9.tgz \
	&& tar -xf mongodb-linux-x86_64-3.6.9.tgz \
	&& rm -f mongodb-linux-x86_64-3.6.9.tgz

ADD https://packages.baidu.com/app/openrasp/rasp-cloud.tar.gz /tmp

RUN cd /tmp/ \
	&& tar -xf rasp-cloud.tar.gz \
	&& rm -f rasp-cloud.tar.gz

COPY *.sh /root/
RUN chmod +x /root/*.sh
