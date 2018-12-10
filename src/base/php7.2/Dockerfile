FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y epel-release \
	&& curl https://packages.baidu.com/app/remi/remi-release-7.rpm -o remi-release-7.rpm \
	&& rpm -ivh remi-release-7.rpm \
	&& rm -f remi-release-7.rpm

RUN yum install -y php72 php72-fpm php72-php php72-php-fpm php72-php-cli \
	php72-php-mysqlnd php72-php-gd php72-php-soap php72-php-bcmath \
	php72-php-mcrypt php72-php-mbstring php72-php-xml php72-php-pecl-yaml \
	php72-php-ioncube-loader php72-php-pecl-xdebug php72-php-intl

# 禁用 xdebug
RUN mv /etc/opt/remi/php72/php.d/15-xdebug.ini /etc/opt/remi/php72/php.d/15-xdebug.ini.bak

RUN ln -s /opt/remi/php72/root/bin/php /usr/bin
# COPY php.ini /opt/remi/php72/root/etc/php.ini

# 安装 composer
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/bin/composer

# 初始化 HTML
COPY index.php /var/www/html/index.php	

# 其他配置
COPY *.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
