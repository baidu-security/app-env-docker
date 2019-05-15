FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# MySQL audit 官方文档
# https://github.com/mcafee/mysql-audit/wiki/Installation
 
ENV mysql_url https://packages.baidu.com/app/mysql-5.7.17/mysql-5.7.17-linux-glibc2.5-x86_64.tar.gz
ENV audit_url https://packages.baidu.com/app/mysql-5.7.17/audit-plugin-mysql-5.7-1.1.6-784-linux-x86_64.zip

RUN cd /usr/local/ \
	&& curl "$mysql_url" -o mysql.tar.gz \
	&& tar -xf mysql.tar.gz \
	&& rm -f mysql.tar.gz \
	&& mv mysql-*/ mysql

RUN cd /usr/local/mysql/lib/plugin \
	&& curl "$audit_url" -o audit.zip \
	&& unzip -qq audit.zip \
	&& rm -f audit.zip \
	&& mv audit-plugin-*/lib/libaudit_plugin.so .

COPY *.cnf /etc/

RUN mkdir -p /data/{mysql,binlog} \
	&& chown mysql -R /usr/local/mysql /data \
	&& /usr/local/mysql/bin/mysqld --initialize-insecure --user=mysql

COPY *.sh /root/	
RUN chmod +x /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
