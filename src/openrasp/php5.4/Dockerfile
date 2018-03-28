FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD https://packages.baidu.com/app/openrasp/rasp-php.tar.bz2 /tmp
ADD https://packages.baidu.com/app/openrasp/php-vulns.tar.gz /var/www/html

RUN cd /tmp \
	&& tar -xf rasp-php.tar.bz2 \
	&& bash rasp-php-*/install.php -d /opt/rasp/

RUN cd /var/www/html \
	&& tar -xf php-vulns.tar.gz \
	&& mv vulns/* . \
	&& rm -f php-vulns.tar.gz \
	&& echo '<?php phpinfo(); ?>' > /var/www/html/info.php

COPY start.sh /root/
