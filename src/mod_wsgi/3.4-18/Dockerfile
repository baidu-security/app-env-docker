FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y httpd uwsgi mod_wsgi

COPY root /
ENTRYPOINT ["/bin/bash", "/root/start.sh"]
