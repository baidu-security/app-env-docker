FROM openrasp/php5.3

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD https://packages.baidu.com/app/openrasp/testcases/php-vulns.tar.gz /var/www/html

RUN cd /var/www/html \
	&& tar -xf php-vulns.tar.gz \
	&& mv vulns/* . \
	&& rm -f php-vulns.tar.gz \
	&& echo '<?php phpinfo(); ?>' > /var/www/html/info.php

COPY *.sh /root/
RUN chmod +x /root/*.sh
RUN /root/version.sh

