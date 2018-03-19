FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD https://packages.baidu.com/app/openrasp-release.tar.bz2 /tmp
ADD https://packages.baidu.com/app/php-vulns.tar.gz /var/www/html

RUN cd /tmp \
	&& tar -xf openrasp-release.tar.bz2 \
	&& bash openrasp-release/install.sh

RUN cd /var/www/html \
	&& tar -xf php-vulns.tar.gz \
	&& mv vulns/* . \
	&& rm -f php-vulns.tar.gz \
	&& echo '<?php phpinfo(); ?>' > /var/www/html/info.php

COPY start.sh /root/