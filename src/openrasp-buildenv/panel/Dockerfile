FROM openrasp/devtoolset-3

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN cd /tmp \
	&& curl https://packages.baidu.com/app/node-v10.14.1-linux-x64.tar.xz -o package.tar.xz \
	&& tar -xf package.tar.xz && rm -f package.tar.xz \
	&& mv node-*/ /usr/local/nodejs \
	&& ln -s /usr/local/nodejs/bin/node /usr/bin \
	&& ln -s /usr/local/nodejs/bin/npm /usr/bin

RUN cd /tmp \
	&& curl https://packages.baidu.com/app/go/go1.13.7.linux-amd64.tar.gz -o package.tar.xz \
	&& tar -xf package.tar.xz && rm -f package.tar.xz \
	&& mv go /usr/local/go \
	&& ln -s /usr/local/go/bin/go /usr/bin

# 下载二进制 node_modules
RUN cd /root \
	&& curl https://packages.baidu.com/app/openrasp/node_modules.tar.gz -o node_modules.tar.gz \
	&& tar -xf node_modules.tar.gz

# 下载二进制的 beego
RUN cd /root \
	&& curl https://packages.baidu.com/app/openrasp/bee-bin.tar	-o bee-bin.tar

COPY *.sh /root/
RUN chmod +x /root/*.sh
