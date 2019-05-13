FROM openrasp/php5.4

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum -y install openldap-servers openldap-clients openssh-server sssd rsyslog

RUN cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG \
	&& chown ldap /var/lib/ldap/DB_CONFIG

COPY ldif /tmp/ldif/
COPY start.sh /root/
COPY /etc/ /etc/
RUN chmod 600 /etc/sssd/sssd.conf

EXPOSE 389
