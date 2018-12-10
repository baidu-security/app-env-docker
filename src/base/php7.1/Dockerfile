FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y epel-release \
	&& curl https://packages.baidu.com/app/remi/remi-release-7.rpm -o remi-release-7.rpm \
	&& rpm -ivh remi-release-7.rpm \
	&& rm -f remi-release-7.rpm

RUN yum install -y php71 php71-fpm php71-php php71-php-fpm php71-php-cli \
	php71-php-mysqlnd php71-php-gd php71-php-soap php71-php-bcmath \
	php71-php-mcrypt php71-php-mbstring php71-php-xml php71-php-pecl-yaml \
	php71-php-ioncube-loader php71-php-pecl-xdebug php71-php-intl

# 禁用 xdebug
RUN mv /etc/opt/remi/php71/php.d/15-xdebug.ini /etc/opt/remi/php71/php.d/15-xdebug.ini.bak

RUN ln -s /opt/remi/php71/root/bin/php /usr/bin
# COPY php.ini /opt/remi/php71/root/etc/php.ini

# 安装 composer
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/bin/composer

# 初始化 HTML
COPY index.php /var/www/html/index.php	

# 其他配置
COPY *.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
