FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 源代码
ENV bin_url https://packages.baidu.com/app/spring-security-oauth2-2.0.10-server.jar

RUN curl "$bin_url" -o /root/springboot.jar

COPY *.sh /root/
RUN chmod +x /root/*.sh

COPY mysql.tar.gz /tmp/
RUN tar -zxf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
