FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD https://packages.baidu.com/app/openrasp/release/latest/rasp-php-linux.tar.bz2 /tmp
ADD https://packages.baidu.com/app/xvwa-master.zip /tmp/xvwa.zip

# 安装 DVWA
RUN cd /tmp \
	&& unzip -q /tmp/xvwa.zip \
	&& rm -f /tmp/xvwa.zip \
	&& mv xvwa-master /var/www/html/xvwa

# 安装 OpenRASP
RUN cd /tmp \
	&& tar -xf rasp-php-linux.tar.bz2 \
	&& php rasp-php-*/install.php -d /opt/rasp/ \
	&& rm -rf rasp-php*

COPY index.php /var/www/html/
COPY config.php /var/www/html/xvwa/xvwa/config.php
COPY start.sh /root/
