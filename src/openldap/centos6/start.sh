#!/bin/bash

cd /tmp/ldif
useradd user1

echo '[-] Staring slapd'
slapd -h 'ldapi:/// ldap:/// ldaps:///'
# slapd -h 'ldapi:/// ldap:/// ldaps:///' -f /etc/openldap/slapd.conf

echo '[-] Init LDAP server'
for x in chrootpw.ldif /etc/openldap/schema/{cosine.ldif,nis.ldif,inetorgperson.ldif} openssh-lpk.ldif sudo.ldif index.ldif
do
	echo "-> $x"
    ldapadd -Y EXTERNAL -H ldapi:/// -f "$x"
done

ldapmodify -Y EXTERNAL -H ldapi:/// -f chdomain.ldif
ldapadd -x -w 123456 -D cn=Manager,dc=srv,dc=world -f basedomain.ldif

echo '[-] Staring SSSD, logging to /tmp/sssd.log'
chmod 600 /etc/sssd/sssd.conf
/usr/sbin/sssd -i -d10 &> /tmp/sssd.log &

echo '[-] Starting sshd'
ssh-keygen -N "" -f /root/.ssh/id_rsa
echo AuthorizedKeysCommand /usr/bin/sss_ssh_authorizedkeys >> /etc/ssh/sshd_config

# CentOS 6 不支持
# echo AuthorizedKeysCommandUser nobody >> /etc/ssh/sshd_config
ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

/usr/sbin/sshd

echo "Debug sudo /var/log/sudo_debug.log all@debug" >> /etc/sudo.conf
echo "Debug sudoers.so /var/log/sudo_debug.log all@debug" >> /etc/sudo.conf

echo '[-] Adding test/test2/search user (password: test)'
cat > ssh-user.ldif << EOF
# sudo config
dn: cn=defaults,ou=SUDOers,ou=People,dc=srv,dc=world
objectClass: top
objectClass: sudoRole
cn: defaults
description: Default sudoOption's go here
sudoOption: secure_path = /sbin:/bin:/usr/sbin:/usr/bin

dn: cn=test,ou=SUDOers,ou=People,dc=srv,dc=world
objectClass: top
objectClass: sudoRole
cn: test
sudoUser: test
sudoHost: ALL
sudoRunAsUser: ALL
sudoCommand: ALL
sudoCommand: !/bin/cp

dn: cn=test2,ou=SUDOers,ou=People,dc=srv,dc=world
objectClass: top
objectClass: sudoRole
cn: test2
sudoUser: test2
sudoHost: ALL
sudoRunAsUser: ALL
sudoCommand: ALL
sudoOption: !authenticate

# groups
dn: cn=testgroup,ou=People,dc=srv,dc=world
objectClass: top
objectClass: posixGroup
gidNumber: 2000

# userlist
dn: cn=test,ou=People,dc=srv,dc=world
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
userPassword: {SSHA}5UtMxV1rgztbZeSpI0TiGgw20sSb7muq
sshPublicKey: $(cat /root/.ssh/id_rsa.pub)

dn: cn=test2,ou=People,dc=srv,dc=world
cn: Test Account 2
uid: test2
uidNumber: 2001
gidNumber: 2000
homeDirectory: /home/test2
loginShell: /bin/bash
objectClass: account
objectClass: posixAccount
objectClass: top
objectClass: shadowAccount
objectClass: ldapPublicKey
userPassword: {SSHA}5UtMxV1rgztbZeSpI0TiGgw20sSb7muq
sshPublicKey: $(cat /root/.ssh/id_rsa.pub)

# search
dn: cn=search,ou=People,dc=srv,dc=world
cn: Search Account
gidNumber: 2001
homeDirectory: /home/clientsearch
loginShell: /sbin/nologin
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: top
sn: search
uid: search
uidNumber: 2001
userPassword: {SSHA}wDaMYB/BsTdOzBgsJN7JdOfEcLRXM6ar
EOF
ldapadd -x -w 123456 -D cn=Manager,dc=srv,dc=world -f ssh-user.ldif 

cat << EOF

[-] To run tests against LDAP server
 -  ldapsearch -D cn=Manager,dc=srv,dc=world -x -w 123456 -b dc=srv,dc=world

[-] To run tests against SSSD (password: test)
 -  ssh test@localhost
 -  sudo ls -lah /

EOF

cd /tmp/ldif
bash

