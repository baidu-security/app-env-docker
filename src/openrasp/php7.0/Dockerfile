FROM openrasp/php7.0

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD https://packages.baidu.com/app/openrasp/rasp-php-linux.tar.bz2 /tmp
ADD https://packages.baidu.com/app/openrasp/php-vulns.tar.gz /var/www/html

RUN cd /tmp \
	&& tar -xf rasp-php-linux.tar.bz2 \
	&& php rasp-php-*/install.php -d /opt/rasp/ \
	&& rm -rf rasp-php*

RUN curl https://packages.baidu.com/app/openrasp/999-event-logger.js -o /opt/rasp/plugins/999-event-logger.js

RUN cd /var/www/html \
	&& tar -xf php-vulns.tar.gz \
	&& mv vulns/* . \
	&& rm -f php-vulns.tar.gz \
	&& echo '<?php phpinfo(); ?>' > /var/www/html/info.php

# 禁用 xdebug
RUN mv /etc/opt/remi/php70/php.d/15-xdebug.ini /etc/opt/remi/php70/php.d/15-xdebug.ini.bak

COPY start.sh /root/
