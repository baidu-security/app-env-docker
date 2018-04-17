FROM openrasp/node8.5

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN mkdir -p /web/ \
	&& cd /web/ \
	&& npm install node-serialize@0.0.4 express cookie-parser escape-html

COPY scripts/*.js /web/
COPY start.sh /root/

EXPOSE 80
