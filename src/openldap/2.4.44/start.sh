#!/bin/bash

cd /tmp/ldif

echo '[-] Staring slapd'
slapd -h 'ldapi:/// ldap:/// ldaps:///'

echo '[-] Init LDAP server'
for x in chrootpw.ldif openssl-lpk.ldif /etc/openldap/schema/{cosine.ldif,nis.ldif,inetorgperson.ldif}
do
    ldapadd -Y EXTERNAL -H ldapi:/// -f "$x"
done

ldapmodify -Y EXTERNAL -H ldapi:/// -f chdomain.ldif 
ldapadd -x -w 123456 -D cn=Manager,dc=srv,dc=world -f basedomain.ldif 

echo '[-] Starting rsyslog'
/usr/sbin/rsyslogd

echo '[-] Staring SSSD'
/usr/sbin/sssd

echo '[-] Starting sshd'
ssh-keygen -N "" -f /root/.ssh/id_rsa
echo AuthorizedKeysCommand /usr/bin/sss_ssh_authorizedkeys >> /etc/ssh/sshd_config
echo AuthorizedKeysCommandUser nobody >> /etc/ssh/sshd_config
/usr/sbin/sshd-keygen
/usr/sbin/sshd

echo '[-] Adding test user'
cat > ssh-user.ldif << EOF
dn: uid=test,ou=People,dc=srv,dc=world
cn: Test Account
uid: test
uidNumber: 2000
gidNumber: 2000
homeDirectory: /home/test
loginShell: /bin/bash
objectClass: account
objectClass: posixAccount
objectClass: top
objectClass: shadowAccount
objectClass: ldapPublicKey
userPassword: {SSHA}0Kz3lPob/c6UPpbw7PbyCd02wK0e0Yya
sshPublicKey: $(cat /root/.ssh/id_rsa.pub)
EOF
ldapadd -x -w 123456 -D cn=Manager,dc=srv,dc=world -f ssh-user.ldif 

echo '[-] Example queries'
echo ' -  ldapsearch -D cn=Manager,dc=srv,dc=world -x -w 123456 -b dc=srv,dc=world'
echo

/etc/init.d/shell.sh /tmp/ldif

