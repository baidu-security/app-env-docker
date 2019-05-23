FROM openrasp/devtoolset-4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 安装指定版本的 PHP
RUN cd /tmp \
	&& curl https://packages.baidu.com/app/php-ts/all.tar.bz2 -o all.tar.bz2 \
	&& tar -xf all.tar.bz2 -C /usr/local \
	&& rm -f all.tar.bz2

COPY *.sh /root/
RUN chmod +x /root/*.sh
