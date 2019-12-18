FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD https://packages.baidu.com/app/openrasp/release/latest/rasp-php-linux.tar.bz2 /tmp
ADD https://packages.baidu.com/app/DVWA-master.zip /tmp/dvwa.zip

# 安装 DVWA
RUN cd /tmp \
	&& unzip -q /tmp/dvwa.zip \
	&& rm -rf /var/www/html /tmp/dvwa.zip \
	&& mv DVWA-master /var/www/html

# 安装 OpenRASP
RUN cd /tmp \
	&& tar -xf rasp-php-linux.tar.bz2 \
	&& php rasp-php-*/install.php -d /opt/rasp/ \
	&& rm -rf rasp-php*

COPY config.inc.php /var/www/html/config/config.inc.php
COPY start.sh /root/
