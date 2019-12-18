FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD https://packages.baidu.com/app/openrasp/release/latest/rasp-php-linux.tar.bz2 /tmp
ADD https://packages.baidu.com/app/bWAPP_latest.zip /tmp/package.zip

# 安装 DVWA
RUN cd /var/www/html \
	&& unzip -q /tmp/package.zip \
	&& rm -rf /tmp/package.zip

# 安装 OpenRASP
RUN cd /tmp \
	&& tar -xf rasp-php-linux.tar.bz2 \
	&& php rasp-php-*/install.php -d /opt/rasp/ \
	&& rm -rf rasp-php*

COPY index.php /var/www/html
COPY settings.php /var/www/html/bWAPP/admin
COPY start.sh /root/
