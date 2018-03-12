FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y php php-curl php-soap php-gd php-xml php-mysql \
	php-pecl-yaml php-mbstring php-bcmath php-pdo php-json

# 安装 composer
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/bin/composer

# 初始化 HTML
COPY index.php /var/www/html/index.php

# 其他配置
COPY start.sh /root/
COPY php.ini /etc/
COPY extensions/* /usr/lib64/php/modules/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80
