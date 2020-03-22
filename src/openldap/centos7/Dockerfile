FROM openrasp/centos7

MAINTAINER OpenRASP <ext_yunfenxi@baidu.com>

RUN yum -y install openldap-servers openldap-clients openssh-server sssd sudo \
	oddjob-mkhomedir authconfig nss-pam-ldapd ldb-tools

RUN cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG \
	&& chown ldap /var/lib/ldap/DB_CONFIG

COPY ldif /tmp/ldif/
COPY start.sh /root/
COPY /etc/ /etc/
COPY /root/ /root/

RUN chmod 600 /etc/sssd/sssd.conf

ENTRYPOINT ["/bin/bash", "/root/start.sh"]
EXPOSE 389
