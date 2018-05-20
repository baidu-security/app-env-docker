FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/wordpress-4.6.1.tar.gz
ENV install_path /var/www/html

# 下载
RUN rm -rf "$install_path" \
	&& curl "$install_url" -o package.tar.gz \
	&& tar xf package.tar.gz \
	&& rm -f package.tar.gz \
	&& mv wordpress "$install_path" \
	&& chmod 777 -R "$install_path" 

# 安装数据库
COPY mysql.tar.bz2 /tmp/
RUN tar -xf /tmp/mysql.tar.bz2 -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.bz2

COPY wp-config.php "$install_path"/
COPY works.po /tmp

# 打补丁，禁止跳转
RUN echo "remove_filter('template_redirect', 'redirect_canonical');" >> "$install_path"/wp-content/themes/twentysixteen/functions.php

# 复制语言文件
RUN mkdir -p "$install_path"/wp-content/languages/ \
	&& msgfmt /tmp/works.po -o "$install_path"/wp-content/languages/zh-CN.mo
