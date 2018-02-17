FROM centos:centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y httpd mariadb-server mariadb php php-curl php-soap php-gd php-xml php-mysql wget curl unzip vim

RUN mysql_install_db
RUN chown mysql -R /var/lib/mysql

RUN echo '<?php echo "OpenRASP for PHP\n"; ?>' > /var/www/html/index.php

COPY *.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80