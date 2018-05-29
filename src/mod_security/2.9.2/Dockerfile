FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum install -y mod_security

RUN cd /tmp \
	&& curl https://packages.baidu.com/app/owasp-modsecurity-crs-3.0-master.zip -o package.zip \
	&& unzip -q package.zip \
	&& cp owasp-modsecurity-crs-*/rules/* /etc/httpd/modsecurity.d/activated_rules \
	&& cp owasp-modsecurity-crs-*/crs-setup.conf.example /etc/httpd/modsecurity.d/crs-setup.conf

COPY start.sh /root/
