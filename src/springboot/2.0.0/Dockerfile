FROM openrasp/java8

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ENV bin_url https://packages.baidu.com/app/spring-boot-2.0.0-websocket-messaging.jar

RUN curl "$bin_url" -o /root/springboot.jar
COPY *.sh /root/

COPY start.sh /root/
ENTRYPOINT ["/bin/bash", "/root/start.sh"]

EXPOSE 80
