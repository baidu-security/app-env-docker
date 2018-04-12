FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/php-decoder-5.5.38.tar.bz2

# 下载
RUN curl "$install_url" -o package.tar.bz2 \
	&& tar xf package.tar.bz2 -C /tmp \
	&& rm -f package.tar.bz2 \
	&& ln -sf /tmp/php-decoder/bin/php /usr/bin/php-decoder
