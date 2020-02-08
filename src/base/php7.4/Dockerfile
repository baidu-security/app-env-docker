FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y epel-release \
	&& curl https://packages.baidu.com/app/remi/remi-release-7.rpm -o remi-release-7.rpm \
	&& rpm -ivh remi-release-7.rpm \
	&& rm -f remi-release-7.rpm

RUN yum install -y php74 php74-fpm php74-php php74-php-fpm php74-php-cli \
	php74-php-mysqlnd php74-php-gd php74-php-soap php74-php-bcmath \
	php74-php-mcrypt php74-php-mbstring php74-php-xml php74-php-pecl-yaml \
	php74-php-pecl-xdebug php74-php-intl

# 禁用 xdebug
RUN mv /etc/opt/remi/php74/php.d/15-xdebug.ini /etc/opt/remi/php74/php.d/15-xdebug.ini.bak

RUN ln -s /opt/remi/php74/root/bin/php /usr/bin
# COPY php.ini /opt/remi/php74/root/etc/php.ini

# 安装 composer
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/bin/composer

# 初始化 HTML
COPY index.php /var/www/html/index.php	

# 其他配置
COPY *.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
