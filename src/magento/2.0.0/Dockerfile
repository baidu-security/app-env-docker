FROM openrasp/php5.6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/magento2-2.0.0.tar.gz
ENV install_path /var/www/html

COPY install-package.tar.gz /tmp/

# 下载 
RUN cd /tmp \
	#&& curl "$install_url" -o package.tar.gz \
	#&& tar -zxf package.tar.gz -C "$install_path" \
	#&& rm -f package.tar.gz \
	&& tar -zxf install-package.tar.gz -C "$install_path" \
	&& rm -f install-package.tar.gz \
	&& chown apache -R "$install_path" \
	&& chmod 777 -R "$install_path"
	
#RUN cd "$install_path" \
#	&& composer install


# 拷贝数据库文件
COPY database.sql /root/

# 更新启动脚本
COPY start.sh /root/
