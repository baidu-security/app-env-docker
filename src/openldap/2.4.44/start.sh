#!/bin/bash

cd /tmp/ldif

echo '[-] Staring slapd'
slapd -h 'ldapi:/// ldap:/// ldaps:///'

echo '[-] Init LDAP server'
for x in chrootpw.ldif /etc/openldap/schema/{cosine.ldif,nis.ldif,inetorgperson.ldif}
do
	ldapadd -Y EXTERNAL -H ldapi:/// -f "$x"
done

ldapmodify -Y EXTERNAL -H ldapi:/// -f chdomain.ldif 
ldapadd -x -w 123456 -D cn=Manager,dc=srv,dc=world -f basedomain.ldif 

echo '[-] Example queries'
echo ' -  ldapsearch -D cn=Manager,dc=srv,dc=world -x -w 123456 -b dc=srv,dc=world'
echo

/etc/init.d/shell.sh /tmp/ldif

