FROM openrasp/java6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD https://packages.baidu.com/app/apache-maven-3.2.3-bin.tar.gz /tmp/mvn.tar.gz

RUN cd /tmp \
	&& tar -xf mvn.tar.gz \
	&& mv apache-maven-3.2.3/ /maven \
	&& rm -f mvn.tar.gz

RUN ln -s /maven/bin/mvn /usr/bin
