#!/bin/bash

chmod -R +x /etc/init.d/*.sh
/etc/init.d/httpd.sh start
/etc/init.d/mysql.sh start

echo '[-] Importing sql file'
mysql < /root/database.sql
rm /root/database.sql


ip_addr=$(/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|head -n 1|awk '{print $2}'|tr -d "addr:")
ip_tag="{docker_ip_addr}"
replace_config(){
	sed -i "s/${ip_tag}/${ip_addr}/g" $1 
}

replace_config "${install_path}/pub/static/_requirejs/frontend/Magento/luma/en_US/requirejs-config.js"
replace_config "${install_path}/pub/static/_requirejs/adminhtml/Magento/backend/en_US/requirejs-config.js"

echo "update magento.core_config_data set value = 'http://${ip_addr}/' where config_id =1;" > config.sql
mysql < config.sql
rm -f config.sql

echo '[-] Accessing 127.0.0.1 for the first time'
curl 127.0.0.1 &>/dev/null

exec /etc/init.d/shell.sh /var/www/html
