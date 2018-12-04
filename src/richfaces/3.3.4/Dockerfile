FROM openrasp/jboss5.0

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/richfaces-examples-3.3.4.Final.zip

RUN curl "$install_url" -o package.zip \
	&& unzip -qq package.zip \
	&& rm -f package.zip \
	&& mv richfaces-examples-*/photoalbum/dist/photoalbum-ear-*.ear /jboss/server/default/deploy

