FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD https://packages.baidu.com/app/openrasp-php-beta.tar.bz2 /tmp
ADD https://packages.baidu.com/app/php-vulns.tar.gz /var/www/html

RUN cd /tmp \
	&& tar -xf openrasp-php-beta.tar.bz2 \
	&& bash openrasp-php-beta/install-centos7.sh

RUN cd /var/www/html \
	&& tar -xf php-vulns.tar.gz \
	&& rm -f php-vulns.tar.gz \
	&& echo '<?php phpinfo(); ?>' > /var/www/html/info.php

COPY start.sh /root/