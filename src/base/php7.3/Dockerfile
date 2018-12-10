FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y epel-release \
	&& curl https://packages.baidu.com/app/remi/remi-release-7.rpm -o remi-release-7.rpm \
	&& rpm -ivh remi-release-7.rpm \
	&& rm -f remi-release-7.rpm

RUN yum install -y php73 php73-fpm php73-php php73-php-fpm php73-php-cli \
	php73-php-mysqlnd php73-php-gd php73-php-soap php73-php-bcmath \
	php73-php-mcrypt php73-php-mbstring php73-php-xml php73-php-pecl-yaml \
	php73-php-ioncube-loader php73-php-pecl-xdebug php73-php-intl

# 禁用 xdebug
RUN mv /etc/opt/remi/php73/php.d/15-xdebug.ini /etc/opt/remi/php73/php.d/15-xdebug.ini.bak

RUN ln -s /opt/remi/php73/root/bin/php /usr/bin
# COPY php.ini /opt/remi/php73/root/etc/php.ini

# 安装 composer
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/bin/composer

# 初始化 HTML
COPY index.php /var/www/html/index.php	

# 其他配置
COPY *.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
