FROM openrasp/php5.3

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url  https://packages.baidu.com/app/hdwiki-v6.0UTF8-20170209.tar.gz
ENV install_package_url https://packages.baidu.com/app/hdwiki-v6.0UTF8-20170209-install-bin.tar.gz
ENV install_path /var/www/html

# 下载
#&& curl "$install_url" -o package.tar.gz \
#&& curl "$install_package_url" -o install-package.tar.gz \
COPY install-package.tar.gz /tmp/
COPY hdwiki-v6.0UTF8-20170209.tar.gz /tmp/package.tar.gz
RUN cd /tmp \
	
	&& tar -zxf package.tar.gz -C "$install_path" \
	&& rm -f package.tar.gz \
	&& chmod 777 -R "$install_path" \
	&& tar -zxf install-package.tar.gz -C "$install_path" \
	&& rm -f install-package.tar.gz

# 安装数据库
COPY mysql.tar.gz /tmp/
RUN tar -zxf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz


