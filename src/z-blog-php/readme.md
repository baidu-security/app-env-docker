## 环境说明

* 镜像src/z-blog-php/1.5.1

  * 后台地址

    http://127.0.0.1/zb_system/login.php

  * 账号/密码：admin/admin123

  * 特殊说明

    * 在根目录下添加了csrf.html文件便于测试CVE-2018-8893
    * 初始化状态主页模版未生成，在首次登录后台之后自动生成

## Z-Blog-PHP 1.5.1 CSRF getshell【CVE-2018-8893】

测试镜像

* src/z-blog-php/1.5.1

影响版本

* Z-Blog-PHP <= 1.5.1

参考链接

* [Z-BlogPHP_1_5_1_Zero GetShell漏洞分析](http://www.freebuf.com/column/169630.html)

Poc

使用管理员账号admin/admin123登录后台，访问url

```shell
http://172.17.0.2/csrf.html
```

生成shell

```
http://172.17.0.2/zb_users/plugin/Totoro/evil.php
```



## Z-Blog-PHP 1.5.1 CSRF getshell【CVE-2018-9153】

测试镜像

- src/z-blog-php/1.5.1

影响版本

- Z-Blog-PHP <= 1.5.1

参考链接

- [Z-Blog两处Getshell分析](https://xz.aliyun.com/t/2277)

Poc

使用管理员账号admin/admin123登录后台，访问url

```
http://172.17.0.2/zb_system/admin/index.php?act=PluginMng
```

在插件上传功能处，上传文件CVE-2018-9153/upload.xml，获得shell

```
http://172.17.0.2/zb_users/plugin/AppCentre/shell.php
```

