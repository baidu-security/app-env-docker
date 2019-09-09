#!/bin/bash

cd /tmp/ldif
useradd user1

echo '[-] Staring slapd'
slapd -h 'ldapi:/// ldap:/// ldaps:///'

echo '[-] Init LDAP server'
for x in chrootpw.ldif /etc/openldap/schema/{sudo.schema,openssh.schema,cosine.ldif,nis.ldif,inetorgperson.ldif} openssh-lpk.ldif sudo.ldif
do
    ldapadd -Y EXTERNAL -H ldapi:/// -f "$x"
done

ldapmodify -Y EXTERNAL -H ldapi:/// -f chdomain.ldif
ldapadd -x -w 123456 -D cn=Manager,dc=srv,dc=world -f basedomain.ldif

echo '[-] Staring SSSD'
/usr/sbin/sssd

echo '[-] Starting sshd'
ssh-keygen -N "" -f /root/.ssh/id_rsa
echo AuthorizedKeysCommand /usr/bin/sss_ssh_authorizedkeys >> /etc/ssh/sshd_config
echo AuthorizedKeysCommandUser nobody >> /etc/ssh/sshd_config
/usr/sbin/sshd-keygen
/usr/sbin/sshd

echo '[-] Adding test:test & search:test user'
cat > ssh-user.ldif << EOF
cn: SUDO users
dn: cn=role1,ou=SUDOers,ou=People,dc=srv,dc=world
objectClass: sudoRole
objectClass: top
sudoCommand: ALL
sudoHost: ALL
sudoUser: test
sudoOption: badpass_message=SUDO LDAP does not work, WTF

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
userPassword: {SSHA}5UtMxV1rgztbZeSpI0TiGgw20sSb7muq
sshPublicKey: $(cat /root/.ssh/id_rsa.pub)

dn: cn=search,ou=People,dc=srv,dc=world
cn: search
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

echo '[-] Example queries'
echo ' -  ldapsearch -D cn=Manager,dc=srv,dc=world -x -w 123456 -b dc=srv,dc=world'
echo

/etc/init.d/shell.sh /tmp/ldif

