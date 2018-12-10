FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y epel-release \
	&& curl https://packages.baidu.com/app/remi/remi-release-7.rpm -o remi-release-7.rpm \
	&& rpm -ivh remi-release-7.rpm \
	&& rm -f remi-release-7.rpm

RUN yum install -y php70 php70-fpm php70-php php70-php-fpm php70-php-cli \
	php70-php-mysqlnd php70-php-gd php70-php-soap php70-php-bcmath \
	php70-php-mcrypt php70-php-mbstring php70-php-xml php70-php-pecl-yaml \
	php70-php-ioncube-loader php70-php-pecl-xdebug php70-php-intl

# 禁用 xdebug
RUN mv /etc/opt/remi/php70/php.d/15-xdebug.ini /etc/opt/remi/php70/php.d/15-xdebug.ini.bak

RUN ln -s /opt/remi/php70/root/bin/php /usr/bin
# COPY php.ini /opt/remi/php70/root/etc/php.ini

# 安装 composer
RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/bin/composer

# 初始化 HTML
COPY index.php /var/www/html/index.php	

# 其他配置
COPY *.sh /root/

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
