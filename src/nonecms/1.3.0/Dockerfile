FROM openrasp/php5.6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/nonecms-1.3.0-bin.tar.gz
ENV install_path /var/www/html

RUN yum install -y php71-php-zip

# 下载 
RUN cd /tmp \
	&& curl "$install_url" -o package.tar.gz \
	&& tar -zxf package.tar.gz -C "$install_path" \
	&& rm -f package.tar.gz \
	&& chmod 777 -R "$install_path" \
	&& sed -i 's/DocumentRoot \"\/var\/www\/html\"/DocumentRoot \"\/var\/www\/html\/public\"/'  /etc/httpd/conf/httpd.conf


# 拷贝数据库文件
COPY database.sql /root/

# 更新启动脚本
COPY start.sh /root/


