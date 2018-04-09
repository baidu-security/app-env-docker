FROM openrasp/node8.5

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN cd /tmp \
	&& curl https://packages.baidu.com/app/express-4.13.1.tar.gz -o package.tar.gz \
	&& tar -xf package.tar.gz \
	&& rm -f package.tar.gz

RUN cd /tmp/express-4.13.1/examples/static-files \
	&& sed -i 's/3000/80/g' index.js \
	&& npm install

COPY start.sh /root/
