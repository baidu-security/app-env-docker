FROM centos:centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y httpd mariadb-server mariadb php php-curl php-soap php-gd php-xml php-mysql wget curl unzip vim bzip2

RUN mysql_install_db \
	&& chown mysql -R /var/lib/mysql

RUN echo '<?php echo "OpenRASP for PHP\n"; ?>' > /var/www/html/index.php

COPY *.sh .bash_history .vimrc /root/
COPY php.ini /etc/php.ini

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80