FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV bin_url https://packages.baidu.com/app/spring-boot-2.0.0.RC1-data-commons-web.jar

COPY *.sh /root/
RUN curl "$bin_url" -o /root/springboot.jar \
	&& chmod +x /root/*.sh

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 80
