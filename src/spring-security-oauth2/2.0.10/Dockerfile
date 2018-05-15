FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

# 源代码
# https://github.com/CaledoniaProject/spring-data-web
ENV bin_url https://packages.baidu.com/app/spring-boot-2.0.0.RC1-data-commons-web.jar

COPY spring-security-oauth2-2.0.10-server.jar /root/springboot.jar
COPY *.sh /root/

#RUN curl "$bin_url" -o /root/springboot.jar \

RUN chmod +x /root/*.sh

COPY mysql.tar.gz /tmp/
RUN tar -zxf /tmp/mysql.tar.gz -C /var/lib/mysql \
	&& chown mysql -R /var/lib/mysql \
	&& rm -f /tmp/mysql.tar.gz


ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
