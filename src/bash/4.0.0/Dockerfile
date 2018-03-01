FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

ADD  https://packages.baidu.com/app/bash-4.0.0.bin /bash4.0

COPY test.sh /var/www/cgi-bin
COPY start.sh /root/

RUN  chmod +x /var/www/cgi-bin/test.sh /bash4.0

ENTRYPOINT ["/bin/bash", "/root/start.sh"]