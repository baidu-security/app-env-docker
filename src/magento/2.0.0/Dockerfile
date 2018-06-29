FROM openrasp/php5.6

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV install_url https://packages.baidu.com/app/magento2-2.0.0.tar.gz
ENV install_bin_url https://packages.baidu.com/app/magento2-2.0.0-bin.tar.gz
ENV install_path /var/www/html



# 下载 
RUN cd /tmp \
	&& curl "$install_bin_url" -o install-package.tar.gz \
	&& tar -zxf install-package.tar.gz -C "$install_path" \
	&& rm -f install-package.tar.gz \
	&& chown apache -R "$install_path" \
	&& chmod 777 -R "$install_path"

# 拷贝数据库文件
COPY database.sql /root/

# 更新启动脚本
COPY start.sh /root/
